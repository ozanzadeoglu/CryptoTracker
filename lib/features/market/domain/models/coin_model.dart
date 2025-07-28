import 'package:crypto_tracker/core/cache/cache_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'coin_model.freezed.dart';
part 'coin_model.g.dart';

/// Represents the core, cacheable data for a single cryptocurrency.
///
/// This model is designed based on the data returned from the CoinGecko `/coins/markets` endpoint.
/// It contains all the necessary information for both list views and the basic details of a coin.
@freezed
@HiveType(typeId: HiveTypeIds.coin)
abstract class Coin with _$Coin {
  const factory Coin({
    /// The unique identifier for the coin (e.g., 'bitcoin').
    @HiveField(0) required String id,
    
    /// The ticker symbol for the coin (e.g., 'btc').
    @HiveField(1) required String symbol,
    
    /// The display name of the coin (e.g., 'Bitcoin').
    @HiveField(2) required String name,
    
    /// The URL of the coin's logo image.
    @HiveField(3) required String image,
    
    /// The current price in the user's selected fiat currency.
    @HiveField(4) @JsonKey(name: 'current_price') required double currentPrice,
    
    /// The total market capitalization in the user's selected fiat currency.
    @HiveField(5) @JsonKey(name: 'market_cap') required int? marketCap,

    // The rank of coin on market cap.
    @HiveField(8) @JsonKey(name: 'market_cap_rank') required int marketCapRank,

    /// The percentage change in price over the last 24 hours.
    @HiveField(6) @JsonKey(name: 'price_change_percentage_24h') required double priceChangePercentage24h,
    
    /// A small list of price points for the last 7 days, used for a preview sparkline chart.
    /// This can be null if the API doesn't provide it.
    @HiveField(7) @JsonKey(name: 'sparkline_in_7d') Sparkline? sparkline,
  }) = _Coin;

  /// Creates a [Coin] instance from a JSON map.
  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
}

/// Represents the sparkline data for a [Coin].
@freezed
@HiveType(typeId: HiveTypeIds.sparkline)
abstract class Sparkline with _$Sparkline {
  const factory Sparkline({
    /// A list of price points over a time period.
    @HiveField(0) required List<double> price,
  }) = _Sparkline;
  
  /// Creates a [Sparkline] instance from a JSON map.
  factory Sparkline.fromJson(Map<String, dynamic> json) => _$SparklineFromJson(json);
}