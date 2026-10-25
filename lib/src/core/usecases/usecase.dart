/// A single application action (team baseline). Use cases return results —
/// usually `DataState<T>` — and never throw to the UI (plan §8.4.2).
abstract interface class UseCase<Result, Params> {
  Future<Result> call(Params params);
}

/// A use case that exposes a live stream (e.g. `watchDay`).
abstract interface class StreamUseCase<Result, Params> {
  Stream<Result> call(Params params);
}

/// For use cases without arguments.
final class NoParams {
  const NoParams();
}
