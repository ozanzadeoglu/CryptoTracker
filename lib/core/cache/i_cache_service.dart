/// Defines the contract for a generic key-value caching service.
///
/// This abstraction allows the underlying cache implementation
/// to be swapped without affecting the data sources that use it.
abstract class ICacheService {
  /// Retrieves a value from the cache for the given [key].
  /// Returns `null` if the key is not found.
  Future<T?> get<T>(String key);

  /// Saves a [value] to the cache with the given [key].
  Future<void> put<T>(String key, T value);

  /// Deletes the value associated with the given [key] from the cache.
  Future<void> delete(String key);
  
  /// Clears all data from the cache.
  Future<void> clear();
}