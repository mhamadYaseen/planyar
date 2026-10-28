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
import '../../domain/usecases/recovery_usecases.dart';

part 'recovery_bloc.freezed.dart';

@freezed
sealed class RecoveryEvent with _$RecoveryEvent {
  const factory RecoveryEvent.started() = _Started;

  const factory RecoveryEvent.restoreLatestPressed() = _RestoreLatestPressed;

  const factory RecoveryEvent.importPressed() = _ImportPressed;

  /// The user confirmed restoring [RecoveryState.pending].
  const factory RecoveryEvent.restoreConfirmed() = _RestoreConfirmed;

  const factory RecoveryEvent.restoreCancelled() = _RestoreCancelled;

  const factory RecoveryEvent.exportPressed({ShareAnchor? anchor}) = _ExportPressed;

  const factory RecoveryEvent.failureShown() = _FailureShown;
}

@freezed
abstract class RecoveryState with _$RecoveryState {
  const factory RecoveryState({
    /// Importable (ZIP) safety backups, newest first.
    @Default(DataState<List<SafetyBackup>>.initial()) DataState<List<SafetyBackup>> safetyBackups,
    @Default(false) bool busy,

    /// A read, valid backup waiting for the user's confirmation.
    ReadBackup? pending,

    /// Shown once in a snackbar.
    Failure? failure,

    /// A backup was restored: the app can start again.
    @Default(false) bool restored,
  }) = _RecoveryState;

  const RecoveryState._();

  SafetyBackup? get latestSafetyBackup => switch (safetyBackups) {
    DataSuccess(:final data) => data.firstOrNull,
    _ => null,
  };
}

/// The Recovery screen (S28): restore the latest safety backup, import a
/// backup, or export the raw database file. Retrying is the page's job (it
/// restarts the app).
class RecoveryBloc extends Bloc<RecoveryEvent, RecoveryState> {
  RecoveryBloc({
    required this._listSafety,
    required this._pick,
    required this._read,
    required this._restore,
    required this._exportDatabase,
  }) : super(const RecoveryState()) {
    on<_Started>((event, emit) async {
      final result = await _listSafety(const NoParams());
      emit(
        state.copyWith(
          safetyBackups: switch (result) {
            DataSuccess(:final data) => DataState.success([
              for (final b in data)
                if (!b.isRawDatabase) b,
            ]),
            DataError(:final failure) => DataState.error(failure),
            _ => const DataState.initial(),
          },
        ),
      );
    });
    on<_RestoreLatestPressed>((event, emit) async {
      final latest = state.latestSafetyBackup;
      if (latest == null || state.busy) return;
      await _readForConfirmation(ImportSource(path: latest.path, fileName: latest.fileName), emit);
    });
    on<_ImportPressed>((event, emit) async {
      if (state.busy) return;
      emit(state.copyWith(busy: true));
      final picked = await _pick(const NoParams());
      switch (picked) {
        case DataSuccess(data: final source?):
          await _readForConfirmation(source, emit);
        case DataError(:final failure):
          emit(state.copyWith(busy: false, failure: failure));
        default:
          emit(state.copyWith(busy: false));
      }
    });
    on<_RestoreConfirmed>((event, emit) async {
      final backup = state.pending;
      if (backup == null) return;
      emit(state.copyWith(busy: true, pending: null));
      final result = await _restore(backup);
      emit(
        state.copyWith(
          busy: false,
          restored: result is DataSuccess,
          failure: switch (result) {
            DataError(:final failure) => failure,
            _ => null,
          },
        ),
      );
    });
    on<_RestoreCancelled>((event, emit) => emit(state.copyWith(pending: null)));
    on<_ExportPressed>((event, emit) async {
      final result = await _exportDatabase(event.anchor);
      if (result case DataError(:final failure)) emit(state.copyWith(failure: failure));
    });
    on<_FailureShown>((event, emit) => emit(state.copyWith(failure: null)));
  }

  final ListSafetyBackups _listSafety;
  final PickBackupFile _pick;
  final ReadBackupFile _read;
  final RestoreDatabase _restore;
  final ExportDatabaseFile _exportDatabase;

  Future<void> _readForConfirmation(ImportSource source, Emitter<RecoveryState> emit) async {
    emit(state.copyWith(busy: true));
    final read = await _read(source);
    emit(switch (read) {
      DataSuccess(:final data) => state.copyWith(busy: false, pending: data),
      DataError(:final failure) => state.copyWith(busy: false, failure: failure),
      _ => state.copyWith(busy: false),
    });
  }
}
