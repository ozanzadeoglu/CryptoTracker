import 'package:crypto_tracker/core/network/api_failure.dart';

/// Utility class to wrap result data from an API call.
///
/// Evaluate the result using a switch statement:
/// ```dart
/// switch (result) {
///   case Success(value: final data): {
///     // Handle the success case with the data
///     print(data);
///   }
///   case Failure(failure: final error): {
///     // Handle the failure case with the error
///     print(error.message);
///   }
/// }
/// ```
sealed class ApiResult<T> {
  const ApiResult();

  /// Creates a successful [ApiResult], completed with the specified [value].
  const factory ApiResult.success(T value) = Success._;

  /// Creates an error [ApiResult], completed with the specified [failure] object.
  const factory ApiResult.failure(ApiFailure failure) = Failure._;
}

/// Subclass of [ApiResult] for success values.
final class Success<T> extends ApiResult<T> {
  const Success._(this.value);

  /// Returned value in result.
  final T value;

  @override
  String toString() => 'ApiResult<$T>.success($value)';
}

/// Subclass of [ApiResult] for error values.
final class Failure<T> extends ApiResult<T> {
  const Failure._(this.failure);

  /// Returned [ApiFailure] object in result.
  final ApiFailure failure;

  @override
  String toString() => 'ApiResult<$T>.failure($failure)';
}