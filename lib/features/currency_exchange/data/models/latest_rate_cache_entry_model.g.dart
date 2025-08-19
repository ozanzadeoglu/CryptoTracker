// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_rate_cache_entry_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatestRateCacheEntryModelAdapter
    extends TypeAdapter<LatestRateCacheEntryModel> {
  @override
  final typeId = 7;

  @override
  LatestRateCacheEntryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LatestRateCacheEntryModel(
      rate: (fields[0] as num).toDouble(),
      fetchedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LatestRateCacheEntryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.rate)
      ..writeByte(1)
      ..write(obj.fetchedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatestRateCacheEntryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
