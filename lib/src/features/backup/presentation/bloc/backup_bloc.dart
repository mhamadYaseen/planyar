import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/files/file_gateway.dart';
import '../../../../core/files/safety_backup.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../domain/entities/backup_actions.dart';
import '../../domain/entities/backup_files.dart';
import '../../domain/usecases/backup_usecases.dart';

part 'backup_bloc.freezed.dart';
part 'backup_event.dart';
part 'backup_state.dart';

/// Backup & restore (S22): last export, export/save, import, safety backups
/// and the import log.
class BackupBloc extends Bloc<BackupEvent, BackupState> {
  BackupBloc({
    required this._watchStatus,
    required this._export,
    required this._pick,
    required this._listSafety,
    required this._shareSafety,
  }) : super(const BackupState()) {
    on<_Started>(_onStarted);
    on<_SafetyBackupsRefreshed>((event, emit) => _loadSafety(emit));
    on<_ExportPressed>(_onExportPressed);
    on<_ImportPressed>(_onImportPressed);
    on<_RestorePressed>(
      (event, emit) => emit(
        state.copyWith(
          pendingImport: ImportSource(path: event.backup.path, fileName: event.backup.fileName, replaceOnly: true),
        ),
      ),
    );
    on<_SafetySharePressed>(_onSafetySharePressed);
    on<_NoticeShown>((event, emit) => emit(state.copyWith(notice: null)));
    on<_ImportOpened>((event, emit) => emit(state.copyWith(pendingImport: null)));
  }

  final WatchBackupStatus _watchStatus;
  final ExportBackup _export;
  final PickBackupFile _pick;
  final ListSafetyBackups _listSafety;
  final ShareSafetyBackup _shareSafety;

  Future<void> _onStarted(_Started event, Emitter<BackupState> emit) async {
    await _loadSafety(emit);
    await emit.forEach(_watchStatus(const NoParams()), onData: (status) => state.copyWith(status: status));
  }

  Future<void> _loadSafety(Emitter<BackupState> emit) async {
    if (state.safetyBackups is! DataSuccess) emit(state.copyWith(safetyBackups: const DataState.loading()));
    emit(state.copyWith(safetyBackups: await _listSafety(const NoParams())));
  }

  Future<void> _onExportPressed(_ExportPressed event, Emitter<BackupState> emit) async {
    if (state.busy != null) return;
    emit(state.copyWith(busy: BackupTask.exporting));
    final result = await _export(ExportParams(event.destination, anchor: event.anchor));
    emit(
      state.copyWith(
        busy: null,
        notice: switch (result) {
          DataSuccess(data: final r) when r.completed => BackupNotice.exported(
            fileName: r.fileName,
            destination: event.destination,
          ),
          DataSuccess() => null,
          DataError(:final failure) => BackupNotice.failed(failure),
          _ => null,
        },
      ),
    );
  }

  Future<void> _onImportPressed(_ImportPressed event, Emitter<BackupState> emit) async {
    if (state.busy != null) return;
    emit(state.copyWith(busy: BackupTask.picking));
    final result = await _pick(const NoParams());
    emit(
      state.copyWith(
        busy: null,
        pendingImport: switch (result) {
          DataSuccess(:final data) => data,
          _ => null,
        },
        notice: switch (result) {
          DataError(:final failure) => BackupNotice.failed(failure),
          _ => null,
        },
      ),
    );
  }

  Future<void> _onSafetySharePressed(_SafetySharePressed event, Emitter<BackupState> emit) async {
    final result = await _shareSafety(ShareSafetyBackupParams(event.backup, anchor: event.anchor));
    if (result case DataError(:final failure)) emit(state.copyWith(notice: BackupNotice.failed(failure)));
  }
}
