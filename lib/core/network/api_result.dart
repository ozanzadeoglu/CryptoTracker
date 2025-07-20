import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';


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
@freezed
sealed class ApiResult<S> with _$ApiResult<S> {
  /// Represents a successful result containing a [value].
  const factory ApiResult.success(S value) = Success<S>;

  /// Represents a failure result containing an [ApiFailure].
  const factory ApiResult.failure(ApiFailure failure) = Failure<S>;
}