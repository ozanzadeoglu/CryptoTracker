import 'dart:async';

import 'package:crypto_tracker/core/services/logging/logger_service.dart.dart';
import 'package:logging/logging.dart';

// ignore_for_file: avoid_print

/// An implementation of [ILoggerService] that prints logs to the debug console. This service is intented
/// to be used in production stage.
class ConsoleLoggerService implements ILoggerService {
  StreamSubscription<LogRecord>? _subscription;

  ConsoleLoggerService._internal() {
    Logger.root.level = Level.ALL;

    _subscription = Logger.root.onRecord.listen((record) {
      print(
        '${record.level.name}: ${record.time}: [${record.loggerName}] ${record.message}',
      );
      if (record.error != null) {
        print('  Error: ${record.error}');
      }
      if (record.stackTrace != null) {
        // Only print stack trace for severe errors to reduce noise
        if (record.level >= Level.SEVERE) {
          print('  StackTrace: ${record.stackTrace}');
        }
      }
    });
  }

  // Singleton instance
  static final ConsoleLoggerService instance = ConsoleLoggerService._internal();

  // Helper to get a cached logger instance by name
  Logger _getLogger(String? source) => Logger(source ?? 'App');

  @override
  void logError(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String? source,
  }) {
    _getLogger(source).severe(message, error, stackTrace);
  }

  @override
  void logInfo(String message, {String? source}) {
    _getLogger(source).info(message);
  }

  @override
  void logWarning(
    String message, {
    Object? error, // The new parameter being handled
    String? source,
  }) {
    // We pass the optional error object to the logger.
    _getLogger(source).warning(message, error);
  }

  @override
  void dispose() {
    // Cancel the stream subscription to prevent memory leaks.
    _subscription?.cancel();
    print("ConsoleLoggerService disposed."); // Good for debugging
  }
}
