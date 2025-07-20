import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_details_model.freezed.dart';
part 'coin_details_model.g.dart';

/// Represents additional, detailed data for a single cryptocurrency.
///
/// This model is designed based on the data from the CoinGecko `/coins/{id}` endpoint.
/// It is intended to be fetched on-demand when a user visits a coin's detail screen
/// and is **not intended to be cached** locally to avoid database bloat.
@freezed
abstract class CoinDetails with _$CoinDetails {
  const factory CoinDetails({
    /// A map of language codes (e.g., 'en', 'es') to their respective coin descriptions.
    required Map<String, String> description,
    
    /// Contains URLs for the coin's homepage, blockchain explorers, etc.
    required CoinLinks links,
    
    /// Contains detailed market data like all-time high, all-time low, etc.
    @JsonKey(name: 'market_data') required MarketData marketData,
  }) = _CoinDetails;

  /// Creates a [CoinDetails] instance from a JSON map.
  factory CoinDetails.fromJson(Map<String, dynamic> json) => _$CoinDetailsFromJson(json);
}

/// Represents the various links associated with a coin.
@freezed
abstract class CoinLinks with _$CoinLinks {
  const factory CoinLinks({
    /// A list of homepage URLs. Typically only the first one is used.
    @JsonKey(name: 'homepage', defaultValue: []) required List<String> homepage,
    
    /// A list of blockchain explorer URLs.
    @JsonKey(name: 'blockchain_site', defaultValue: []) required List<String> blockchainSite,
  }) = _CoinLinks;

  /// Creates a [CoinLinks] instance from a JSON map.
  factory CoinLinks.fromJson(Map<String, dynamic> json) => _$CoinLinksFromJson(json);
}

/// Represents detailed market data points for a coin.
@freezed
abstract class MarketData with _$MarketData {
  const factory MarketData({
    /// A map of fiat currency codes to the all-time high value.
    @JsonKey(name: 'ath') required Map<String, double> allTimeHigh,
    
    /// A map of fiat currency codes to the all-time low value.
    @JsonKey(name: 'atl') required Map<String, double> allTimeLow,
    
    /// A map of fiat currency codes to the total 24-hour trading volume.
    @JsonKey(name: 'total_volume') required Map<String, double> totalVolume,
  }) = _MarketData;

  /// Creates a [MarketData] instance from a JSON map.
  factory MarketData.fromJson(Map<String, dynamic> json) => _$MarketDataFromJson(json);
}