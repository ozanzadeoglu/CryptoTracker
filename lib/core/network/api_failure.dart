
/// A sealed class representing all possible API failures.
sealed class ApiFailure {
  final String message;
  const ApiFailure(this.message);

  /// Factory constructor for network connectivity issues.
  const factory ApiFailure.network([String message]) = NetworkFailure._;

  /// Factory for server errors (e.g., 500 Internal Server Error).
  const factory ApiFailure.server({String message, int? statusCode}) = ServerFailure._;
  
  /// Factory for "Not Found" errors (e.g., 404).
  const factory ApiFailure.notFound([String message]) = NotFoundFailure._;

  /// Factory for other, unexpected errors.
  const factory ApiFailure.unknown([String message]) = UnknownFailure._;
}

final class NetworkFailure extends ApiFailure {
  const NetworkFailure._([String message = "Network error occurred."]) : super(message);
}

final class ServerFailure extends ApiFailure {
  final int? statusCode;
  const ServerFailure._({String message = "Server error occurred.", this.statusCode}) : super(message);
}

final class NotFoundFailure extends ApiFailure {
  const NotFoundFailure._([String message = "Resource not found."]) : super(message);
}

final class UnknownFailure extends ApiFailure {
  const UnknownFailure._([String message = "An unknown error occurred."]) : super(message);
}