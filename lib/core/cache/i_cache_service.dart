import 'package:crypto_tracker/core/network/api_result.dart';

/// Defines the contract for a generic key-value caching service.
///
/// This abstraction allows the underlying cache implementation
/// to be swapped without affecting the data sources that use it.
abstract class ICacheService {
  
  /// Retrieves a value of type [T] from the cache for the given [key].
  ///
  /// Returns an [ApiResult.success] containing the value (or `null`)
  /// or [ApiResult.failure] with [ApiFailure] on errors.
  Future<ApiResult<T?>> get<T>(String key);

  /// Saves a [value] of type [T] to the cache with the given [key].
  ///
  /// Returns [ApiResult.success] on success or [ApiResult.failure]
  /// with [ApiFailure] on errors.
  Future<ApiResult<void>> put<T>(String key, T value);

  /// Deletes the value associated with the given [key] from the cache.
  ///
  /// Returns [ApiResult.success] on success or [ApiResult.failure]
  /// with [ApiFailure] on errors.
  Future<ApiResult<void>> delete(String key);
  
  /// Clears all data from the cache.
  ///
  /// Returns [ApiResult.success] on success or [ApiResult.failure]
  /// with [ApiFailure] on errors.
  Future<ApiResult<void>> clear();
}