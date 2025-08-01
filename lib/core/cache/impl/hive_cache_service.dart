import 'package:crypto_tracker/core/network/api_result.dart';
import 'package:crypto_tracker/core/network/api_failure.dart';
import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:crypto_tracker/core/services/logging/logger_service.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

/// Gateway to local storage. 
/// 
/// An implementation of [ICacheService] that uses a Hive [Box] for storage,
/// wrapping results in [ApiResult] to standardize success/failure handling.
///
/// Internally logs operations and errors via the injected [ILoggerService].
/// 
/// Check [ICacheService] doc strings to learn about [R] type.
class HiveCacheService<R> implements ICacheService<R> {
  final Box _box;
  final ILoggerService _logger;

  /// Creates a [HiveCacheService] using the given Hive [Box] and [ILoggerService].
  ///
  /// The [logger] is used to record informational messages and error details.
  HiveCacheService(this._box, this._logger);

  /// Retrieves a value of type [T] from the cache for the given [key].
  ///
  /// Returns [ApiResult.success] containing the value (or `null` if not found),
  /// or [ApiResult.failure] with an [ApiFailure.cache] on Hive errors,
  /// or [ApiFailure.unknown] on any other exceptions.
  @override
  Future<ApiResult<T?>> get<T>(String key) async {
    try {
      _logger.logInfo("Attempting to GET '$key' from cache", source: 'HiveCacheService');
      final raw = await _box.get(key);
      _logger.logInfo("Successfully GET '$key' from cache", source: 'HiveCacheService');
      return ApiResult.success(raw as T?);
    } on HiveError catch (e, st) {
      final msg = "Failed to GET '$key' from Hive: ${e.message}";
      _logger.logError(msg, error: e, stackTrace: st, source: 'HiveCacheService');
      return ApiResult.failure(
        const ApiFailure.cache(),
      );
    } catch (e, st) {
      final msg = "Unknown error GET '$key' from Hive: $e";
      _logger.logError(msg, error: e, stackTrace: st, source: 'HiveCacheService');
      return ApiResult.failure(
        const ApiFailure.unknown(),
      );
    }
  }

  /// Saves a [value] of type [T] to the cache with the given [key].
  ///
  /// Returns [ApiResult.success] on success or [ApiResult.failure]
  /// with [ApiFailure.cache] on Hive errors,
  /// or [ApiFailure.unknown] on any other exceptions.
  @override
  Future<ApiResult<void>> put<T>(String key, T value) async {
    try {
      _logger.logInfo("Attempting to PUT '$key' into cache", source: 'HiveCacheService');
      await _box.put(key, value);
      _logger.logInfo("Successfully PUT '$key' into cache", source: 'HiveCacheService');
      return const ApiResult.success(null);
    } on HiveError catch (e, st) {
      final msg = "Failed to PUT '$key' into Hive: ${e.message}";
      _logger.logError(msg, error: e, stackTrace: st, source: 'HiveCacheService');
      return const ApiResult.failure(
        ApiFailure.cache(),
      );
    } catch (e, st) {
      final msg = "Unknown error PUT '$key' into Hive: $e";
      _logger.logError(msg, error: e, stackTrace: st, source: 'HiveCacheService');
      return const ApiResult.failure(
        ApiFailure.unknown(),
      );
    }
  }

  /// Deletes the value associated with the given [key] from the cache.
  ///
  /// Returns [ApiResult.success] on success or [ApiResult.failure]
  /// with [ApiFailure.cache] on Hive errors,
  /// or [ApiFailure.unknown] on any other exceptions.
  @override
  Future<ApiResult<void>> delete(String key) async {
    try {
      _logger.logInfo("Attempting to DELETE '$key' from cache", source: 'HiveCacheService');
      await _box.delete(key);
      _logger.logInfo("Successfully DELETE '$key' from cache", source: 'HiveCacheService');
      return const ApiResult.success(null);
    } on HiveError catch (e, st) {
      final msg = "Failed to DELETE '$key' from Hive: ${e.message}";
      _logger.logError(msg, error: e, stackTrace: st, source: 'HiveCacheService');
      return const ApiResult.failure(
        ApiFailure.cache(),
      );
    } catch (e, st) {
      final msg = "Unknown error DELETE '$key' from Hive: $e";
      _logger.logError(msg, error: e, stackTrace: st, source: 'HiveCacheService');
      return const ApiResult.failure(
        ApiFailure.unknown(),
      );
    }
  }

  /// Clears all data from the cache.
  ///
  /// Returns [ApiResult.success] on success or [ApiResult.failure]
  /// with [ApiFailure.cache] on Hive errors,
  /// or [ApiFailure.unknown] on any other exceptions.
  @override
  Future<ApiResult<void>> clear() async {
    try {
      _logger.logInfo("Attempting to CLEAR cache", source: 'HiveCacheService');
      await _box.clear();
      _logger.logInfo("Successfully CLEARED cache", source: 'HiveCacheService');
      return const ApiResult.success(null);
    } on HiveError catch (e, st) {
      final msg = "Failed to CLEAR Hive box: ${e.message}";
      _logger.logError(msg, error: e, stackTrace: st, source: 'HiveCacheService');
      return const ApiResult.failure(
        ApiFailure.cache(),
      );
    } catch (e, st) {
      final msg = "Unknown error CLEAR Hive box: $e";
      _logger.logError(msg, error: e, stackTrace: st, source: 'HiveCacheService');
      return const ApiResult.failure(
        ApiFailure.unknown(),
      );
    }
  }
}
