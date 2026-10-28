import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/files/file_gateway.dart';
import '../../../../core/files/safety_backup.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/backup_actions.dart';
import '../../domain/usecases/backup_usecases.dart';

part 'erase_bloc.freezed.dart';

/// The word the user types to confirm (SET-06). The app is English-only.
const eraseConfirmWord = 'ERASE';

@freezed
sealed class EraseEvent with _$EraseEvent {
  const factory EraseEvent.textChanged(String text) = _TextChanged;

  /// "Export a backup first" (SET-06 offers an export before erasing).
  const factory EraseEvent.exportPressed({ShareAnchor? anchor}) = _ExportPressed;

  const factory EraseEvent.erasePressed() = _ErasePressed;
}

@freezed
abstract class EraseState with _$EraseState {
  const factory EraseState({
    @Default('') String text,
    @Default(DataState<ExportResult>.initial()) DataState<ExportResult> export,

    /// Success holds the safety backup (null on an empty device).
    @Default(DataState<SafetyBackup?>.initial()) DataState<SafetyBackup?> erase,
  }) = _EraseState;

  const EraseState._();

  bool get canErase => text.trim() == eraseConfirmWord && erase is! DataLoading && export is! DataLoading;
}

/// Erase all data (SET-06): offers an export, requires typing ERASE, saves a
/// safety backup, then deletes everything.
class EraseBloc extends Bloc<EraseEvent, EraseState> {
  EraseBloc({required this._export, required this._erase}) : super(const EraseState()) {
    on<_TextChanged>((event, emit) => emit(state.copyWith(text: event.text)));
    on<_ExportPressed>((event, emit) async {
      if (state.export is DataLoading) return;
      emit(state.copyWith(export: const DataState.loading()));
      emit(state.copyWith(export: await _export(ExportParams(ExportDestination.share, anchor: event.anchor))));
    });
    on<_ErasePressed>((event, emit) async {
      if (!state.canErase) return;
      emit(state.copyWith(erase: const DataState.loading()));
      emit(state.copyWith(erase: await _erase(const NoParams())));
    });
  }

  final ExportBackup _export;
  final EraseAllData _erase;
}
