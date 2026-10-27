import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Expected failures returned to Blocs instead of thrown (plan §8.4.2).
/// Messages are developer-facing; the UI picks localized text by type.
@freezed
sealed class Failure with _$Failure {
  /// The database rejected or couldn't complete the operation.
  const factory Failure.database(String message) = DatabaseFailure;

  /// Input broke a domain rule (e.g. end before start). [reason] carries a
  /// feature's own value (e.g. `NameProblem.duplicate`) for the UI to word.
  const factory Failure.validation(String message, {Object? reason}) = ValidationFailure;

  /// The record no longer exists (e.g. a deleted task from a notification).
  const factory Failure.notFound(String message) = NotFoundFailure;

  /// A platform service (notifications, files) failed or isn't available.
  const factory Failure.platform(String message) = PlatformFailure;

  /// Anything else; a bug.
  const factory Failure.unexpected(String message) = UnexpectedFailure;
}
