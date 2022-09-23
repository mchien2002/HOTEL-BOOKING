// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoomsAdapter extends TypeAdapter<Rooms> {
  @override
  final int typeId = 3;

  @override
  Rooms read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rooms()
      .._cancelPolicy = fields[0] as String?
      .._content = fields[1] as String?
      .._createdAt = fields[2] as String?
      .._currentPrice = fields[3] as int?
      .._description = fields[4] as String?
      .._facilities = (fields[5] as List?)?.cast<Facilities>()
      .._id = fields[6] as String?
      .._maximumGuests = fields[7] as int?
      .._name = fields[8] as String?
      .._paymentPolicy = fields[9] as String?
      .._price = fields[10] as Price?
      .._roomType = fields[11] as String?;
  }

  @override
  void write(BinaryWriter writer, Rooms obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj._cancelPolicy)
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
      ..write(obj._id)
      ..writeByte(7)
      ..write(obj._maximumGuests)
      ..writeByte(8)
      ..write(obj._name)
      ..writeByte(9)
      ..write(obj._paymentPolicy)
      ..writeByte(10)
      ..write(obj._price)
      ..writeByte(11)
      ..write(obj._roomType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
