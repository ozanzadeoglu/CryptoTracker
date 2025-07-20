// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinDetails _$CoinDetailsFromJson(Map<String, dynamic> json) => _CoinDetails(
  description: Map<String, String>.from(json['description'] as Map),
  links: CoinLinks.fromJson(json['links'] as Map<String, dynamic>),
  marketData: MarketData.fromJson(json['market_data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CoinDetailsToJson(_CoinDetails instance) =>
    <String, dynamic>{
      'description': instance.description,
      'links': instance.links,
      'market_data': instance.marketData,
    };

_CoinLinks _$CoinLinksFromJson(Map<String, dynamic> json) => _CoinLinks(
  homepage:
      (json['homepage'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  blockchainSite:
      (json['blockchain_site'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
);

Map<String, dynamic> _$CoinLinksToJson(_CoinLinks instance) =>
    <String, dynamic>{
      'homepage': instance.homepage,
      'blockchain_site': instance.blockchainSite,
    };

_MarketData _$MarketDataFromJson(Map<String, dynamic> json) => _MarketData(
  allTimeHigh: (json['ath'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  allTimeLow: (json['atl'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  totalVolume: (json['total_volume'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$MarketDataToJson(_MarketData instance) =>
    <String, dynamic>{
      'ath': instance.allTimeHigh,
      'atl': instance.allTimeLow,
      'total_volume': instance.totalVolume,
    };
