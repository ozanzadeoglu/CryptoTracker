/// Defines the contract for a logging service.
abstract class ILoggerService {
  /// Logs a detailed error message, typically with a critical exception and stack trace.
  void logError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String? source,
  });

  /// Logs a warning message for non-critical but important events,
  /// which may optionally include an error object for context.
  void logWarning(String message, {Object? error, String? source});

  /// Logs an informational message for general app flow events.
  void logInfo(String message, {String? source});

  /// Disposes of any resources used by the logger, like stream subscriptions.
  void dispose();
}
