
import 'package:crypto_tracker/core/errors/app_errors.dart';

/// A sealed class representing all possible API failures.
sealed class ApiFailure {
  final AppError? error;
  const ApiFailure(this.error);

  /// Factory constructor for network connectivity issues.
  const factory ApiFailure.network([AppError? error]) = NetworkFailure._;

  /// Factory for server errors (e.g., 500 Internal Server Error).
  const factory ApiFailure.server({AppError? error, int? statusCode}) = ServerFailure._;
  
  /// Factory for "Not Found" errors (e.g., 404).
  const factory ApiFailure.notFound([AppError? error]) = NotFoundFailure._;

  /// Factory for other, unexpected errors.
  const factory ApiFailure.unknown([AppError? error]) = UnknownFailure._;

  /// Factory for cache errors.
  const factory ApiFailure.cache([AppError? error]) = CacheFailure._;
}

final class NetworkFailure extends ApiFailure {
  const NetworkFailure._([super.error]);
}

final class ServerFailure extends ApiFailure {
  final int? statusCode;
  const ServerFailure._({AppError? error, this.statusCode}) : super(error);
}

final class NotFoundFailure extends ApiFailure {
  const NotFoundFailure._([super.error]);
}

final class UnknownFailure extends ApiFailure {
  const UnknownFailure._([super.error]);
}

final class CacheFailure extends ApiFailure {
  const CacheFailure._([super.error]);
}