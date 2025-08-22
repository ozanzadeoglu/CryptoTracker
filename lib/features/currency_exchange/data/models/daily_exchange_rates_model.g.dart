// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_exchange_rates_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyExchangeRatesModelAdapter
    extends TypeAdapter<DailyExchangeRatesModel> {
  @override
  final typeId = 6;

  @override
  DailyExchangeRatesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyExchangeRatesModel(
      date: fields[0] as String,
      base: fields[1] as String,
      rates: (fields[2] as Map).cast<String, double>(),
    );
  }

  @override
  void write(BinaryWriter writer, DailyExchangeRatesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.base)
      ..writeByte(2)
      ..write(obj.rates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyExchangeRatesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyExchangeRatesModel _$DailyExchangeRatesModelFromJson(
  Map<String, dynamic> json,
) => _DailyExchangeRatesModel(
  date: json['date'] as String,
  base: json['base'] as String,
  rates: (json['rates'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$DailyExchangeRatesModelToJson(
  _DailyExchangeRatesModel instance,
) => <String, dynamic>{
  'date': instance.date,
  'base': instance.base,
  'rates': instance.rates,
};
