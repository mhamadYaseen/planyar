import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/data_state.dart';
import '../../domain/entities/backup_actions.dart';
import '../../domain/entities/backup_files.dart';
import '../../domain/entities/import_plan.dart';
import '../../domain/usecases/backup_usecases.dart';

part 'import_bloc.freezed.dart';
part 'import_event.dart';
part 'import_state.dart';

/// Import preview (S23) and result (S24): read the file, pick Replace or
/// Merge with the counts in view, confirm, apply (plan §10.6, BAK-03).
class ImportBloc extends Bloc<ImportEvent, ImportState> {
  ImportBloc({required this._prepare, required this._run}) : super(const ImportState()) {
    on<_Started>(_onStarted);
    on<_ModeChanged>((event, emit) {
      if (!state.replaceOnly) emit(state.copyWith(mode: event.mode));
    });
    on<_ImportSettingsChanged>((event, emit) => emit(state.copyWith(importSettings: event.value)));
    on<_SkipInvalidChanged>((event, emit) => emit(state.copyWith(skipInvalid: event.value)));
    on<_Confirmed>(_onConfirmed);
  }

  final PrepareImport _prepare;
  final RunImport _run;

  Future<void> _onStarted(_Started event, Emitter<ImportState> emit) async {
    final source = event.source;
    emit(
      ImportState(
        source: source,
        preview: const DataState.loading(),
        mode: source.replaceOnly ? ImportMode.replace : ImportMode.merge,
      ),
    );
    emit(state.copyWith(preview: await _prepare(source)));
  }

  Future<void> _onConfirmed(_Confirmed event, Emitter<ImportState> emit) async {
    final preview = state.preview;
    if (!state.canImport || preview is! DataSuccess<ImportPreview>) return;
    emit(state.copyWith(result: const DataState.loading()));
    final result = await _run(
      RunImportParams(backup: preview.data.backup, mode: state.mode, importSettings: state.importSettings),
    );
    emit(state.copyWith(result: result));
  }
}
