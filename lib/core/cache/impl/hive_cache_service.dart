import 'package:crypto_tracker/core/cache/i_cache_service.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

/// An implementation of [ICacheService] that uses a specific Hive [Box] for storage.
class HiveCacheService implements ICacheService {
  final Box _box;

  HiveCacheService(this._box);

  @override
  Future<T?> get<T>(String key) async {
    return _box.get(key) as T?;
  }

  @override
  Future<void> put<T>(String key, T value) async {
    await _box.put(key, value);
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}