// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roomtype_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomTypeAdapter extends TypeAdapter<RoomType> {
  @override
  final int typeId = 2;

  @override
  RoomType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoomType()
      .._area = fields[0] as int?
      .._content = fields[1] as String?
      .._createdAt = fields[2] as String?
      .._currentPrice = fields[3] as int?
      .._description = fields[4] as String?
      .._facilities = (fields[5] as List?)?.cast<Facilities>()
      .._hotel = fields[6] as String?
      .._id = fields[7] as String?
      .._name = fields[8] as String?
      .._numberOfBed = fields[9] as String?
      .._photos = (fields[10] as List?)?.cast<String>()
      .._rooms = (fields[11] as List?)?.cast<Rooms>();
  }

  @override
  void write(BinaryWriter writer, RoomType obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj._area)
      ..writeByte(1)
      ..write(obj._content)
      ..writeByte(2)
      ..write(obj._createdAt)
      ..writeByte(3)
      ..write(obj._currentPrice)
      ..writeByte(4)
      ..write(obj._description)
      ..writeByte(5)
      ..write(obj._facilities)
      ..writeByte(6)
      ..write(obj._hotel)
      ..writeByte(7)
      ..write(obj._id)
      ..writeByte(8)
      ..write(obj._name)
      ..writeByte(9)
      ..write(obj._numberOfBed)
      ..writeByte(10)
      ..write(obj._photos)
      ..writeByte(11)
      ..write(obj._rooms);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
