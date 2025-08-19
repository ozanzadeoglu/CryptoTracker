import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'latest_rate_cache_entry_model.freezed.dart';
part 'latest_rate_cache_entry_model.g.dart';

@freezed
@HiveType(typeId: HiveTypeIds.latestRateCacheEntry)
abstract class LatestRateCacheEntryModel with _$LatestRateCacheEntryModel {
  const LatestRateCacheEntryModel._(); 
  
  const factory LatestRateCacheEntryModel({
    @HiveField(0) required double rate,
    @HiveField(1) required DateTime fetchedAt,
  }) = _LatestRateCacheEntryModel;

  /// Generates a predictable key for storing the latest rate.
  /// Example: "latest_USD_TRY"
  static String generateKey(String from, String to) {
    return 'latest_${from}_$to';
  }
}