// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinAdapter extends TypeAdapter<Coin> {
  @override
  final int typeId = 1;

  @override
  Coin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coin(
      id: fields[0] as String,
      symbol: fields[1] as String,
      name: fields[2] as String,
      image: fields[3] as String,
      currentPrice: fields[4] as double,
      marketCap: fields[5] as int?,
      marketCapRank: fields[8] as int,
      priceChangePercentage24h: fields[6] as double,
      sparkline: fields[7] as Sparkline?,
    );
  }

  @override
  void write(BinaryWriter writer, Coin obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.currentPrice)
      ..writeByte(5)
      ..write(obj.marketCap)
      ..writeByte(8)
      ..write(obj.marketCapRank)
      ..writeByte(6)
      ..write(obj.priceChangePercentage24h)
      ..writeByte(7)
      ..write(obj.sparkline);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SparklineAdapter extends TypeAdapter<Sparkline> {
  @override
  final int typeId = 2;

  @override
  Sparkline read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sparkline(price: (fields[0] as List).cast<double>());
  }

  @override
  void write(BinaryWriter writer, Sparkline obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SparklineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Coin _$CoinFromJson(Map<String, dynamic> json) => _Coin(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  currentPrice: (json['current_price'] as num).toDouble(),
  marketCap: (json['market_cap'] as num?)?.toInt(),
  marketCapRank: (json['market_cap_rank'] as num).toInt(),
  priceChangePercentage24h: (json['price_change_percentage_24h'] as num)
      .toDouble(),
  sparkline: json['sparkline_in_7d'] == null
      ? null
      : Sparkline.fromJson(json['sparkline_in_7d'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CoinToJson(_Coin instance) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'name': instance.name,
  'image': instance.image,
  'current_price': instance.currentPrice,
  'market_cap': instance.marketCap,
  'market_cap_rank': instance.marketCapRank,
  'price_change_percentage_24h': instance.priceChangePercentage24h,
  'sparkline_in_7d': instance.sparkline,
};

_Sparkline _$SparklineFromJson(Map<String, dynamic> json) => _Sparkline(
  price: (json['price'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$SparklineToJson(_Sparkline instance) =>
    <String, dynamic>{'price': instance.price};
