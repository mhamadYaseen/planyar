import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/failures.dart';

part 'data_state.freezed.dart';

/// The state of one async value in a Bloc state (team baseline).
@freezed
sealed class DataState<T> with _$DataState<T> {
  const factory DataState.initial() = DataInitial<T>;
  const factory DataState.loading() = DataLoading<T>;
  const factory DataState.success(T data) = DataSuccess<T>;
  const factory DataState.error(Failure failure) = DataError<T>;
}
