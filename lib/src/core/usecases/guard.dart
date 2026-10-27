import '../error/failures.dart';
import '../utils/data_state.dart';

/// Runs [action] and turns an unexpected exception into a failure, so use
/// cases never throw to the UI (plan §8.4.2).
Future<DataState<T>> guard<T>(Future<T> Function() action, {Failure Function(Object error)? onError}) async {
  try {
    return DataState.success(await action());
  } on Object catch (error) {
    return DataState.error(onError?.call(error) ?? Failure.database(error.toString()));
  }
}
