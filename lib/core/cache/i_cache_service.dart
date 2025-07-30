import 'package:crypto_tracker/core/network/api_result.dart';

// Marker classes used to distinguish feature-specific cache services.
// The core issue was that multiple HiveCacheService instances shared the same 
// base interface (ICacheService), making it difficult for the DI system to 
// differentiate between them.
//
// To solve this, a generic type parameter <R> was added to ICacheService solely 
// for differentiation — it does not affect implementation logic. These empty 
// marker classes (e.g., MarketFeature, SettingsFeature) act as compile-time 
// tags to indicate which feature a particular HiveCacheService belongs to.
class MarketFeature{}
class SettingsFeature{}

/// Defines the contract for a generic key-value caching service.
///
/// This abstraction allows the underlying cache implementation
/// to be swapped without affecting the data sources that use it.
/// 
/// The type parameter [R] is used solely for dependency
/// injection and service differentiation. It has no impact on the runtime
/// behavior or the types of values stored in the cache.
abstract class ICacheService<R> {

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