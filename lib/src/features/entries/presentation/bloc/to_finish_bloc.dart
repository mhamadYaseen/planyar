import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/data_state.dart';
import '../../../day_view/domain/usecases/day_usecases.dart';

part 'to_finish_bloc.freezed.dart';

@freezed
sealed class ToFinishEvent with _$ToFinishEvent {
  const factory ToFinishEvent.started() = _Started;
}

/// Open entries for the To finish page (S11), oldest first. Actions on them
/// go through `EntryActionsBloc`.
class ToFinishBloc extends Bloc<ToFinishEvent, DataState<DayEntries>> {
  ToFinishBloc(this._watchOpen) : super(const DataState.loading()) {
    on<_Started>(
      (event, emit) => emit.forEach<DayEntries>(
        _watchOpen(const NoParams()),
        onData: DataState.success,
        onError: (error, _) => DataState.error(Failure.database(error.toString())),
      ),
    );
  }

  final WatchOpenEntriesWithLabels _watchOpen;
}
