import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../../backup/domain/entities/backup_actions.dart';
import '../../../backup/domain/usecases/backup_usecases.dart';
import '../../domain/entities/starter_label.dart';
import '../../domain/usecases/onboarding_usecases.dart';

part 'onboarding_bloc.freezed.dart';

/// Phase 1 has steps 1–2 (welcome, starter labels); the Sleep routine and
/// reminders steps come with Phases 3 and 6 (plan §5.4).
enum OnboardingStep { welcome, starterLabels }

@freezed
sealed class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.nextPressed() = _NextPressed;
  const factory OnboardingEvent.backPressed() = _BackPressed;
  const factory OnboardingEvent.starterToggled(String name) = _StarterToggled;

  /// "Skip" on the starter step creates no labels.
  const factory OnboardingEvent.skipPressed() = _SkipPressed;

  /// "Restore from a backup" (moving from another phone): pick a file.
  const factory OnboardingEvent.restorePressed() = _RestorePressed;

  /// The page opened [OnboardingState.pendingRestore].
  const factory OnboardingEvent.restoreOpened() = _RestoreOpened;

  /// The backup was imported: onboarding is done, with no starter labels.
  const factory OnboardingEvent.restored() = _Restored;
}

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(OnboardingStep.welcome) OnboardingStep step,

    /// Starter names; all preselected (plan §5.4).
    required Set<String> selected,
    @Default(false) bool finishing,
    @Default(false) bool done,
    Failure? failure,

    /// A picked backup to preview; cleared with `restoreOpened`.
    ImportSource? pendingRestore,
    @Default(false) bool picking,
  }) = _OnboardingState;
}

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(this._finish, this._pick)
    : super(OnboardingState(selected: {for (final s in Starters.labels) s.name})) {
    on<_NextPressed>((event, emit) async {
      if (state.step == OnboardingStep.welcome) {
        emit(state.copyWith(step: OnboardingStep.starterLabels));
      } else {
        await _complete(emit, [
          for (final s in Starters.labels)
            if (state.selected.contains(s.name)) s,
        ]);
      }
    });
    on<_BackPressed>((event, emit) => emit(state.copyWith(step: OnboardingStep.welcome)));
    on<_StarterToggled>((event, emit) {
      final selected = {...state.selected};
      if (!selected.remove(event.name)) selected.add(event.name);
      emit(state.copyWith(selected: selected));
    });
    on<_SkipPressed>((event, emit) => _complete(emit, const []));
    on<_RestorePressed>((event, emit) async {
      if (state.picking) return;
      emit(state.copyWith(picking: true, failure: null));
      final picked = await _pick(const NoParams());
      emit(
        state.copyWith(
          picking: false,
          pendingRestore: switch (picked) {
            DataSuccess(:final data) => data,
            _ => null,
          },
          failure: switch (picked) {
            DataError(:final failure) => failure,
            _ => null,
          },
        ),
      );
    });
    on<_RestoreOpened>((event, emit) => emit(state.copyWith(pendingRestore: null)));
    on<_Restored>((event, emit) => _complete(emit, const []));
  }

  final FinishOnboarding _finish;
  final PickBackupFile _pick;

  Future<void> _complete(Emitter<OnboardingState> emit, List<StarterLabel> chosen) async {
    emit(state.copyWith(finishing: true));
    switch (await _finish(chosen)) {
      case DataError(:final failure):
        emit(state.copyWith(finishing: false, failure: failure));
      default:
        emit(state.copyWith(finishing: false, done: true));
    }
  }
}
