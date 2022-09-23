// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FacilitiesAdapter extends TypeAdapter<Facilities> {
  @override
  final int typeId = 1;

  @override
  Facilities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Facilities()
      .._id = fields[0] as String?
      .._image = fields[1] as String?
      .._name = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, Facilities obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._image)
      ..writeByte(2)
      ..write(obj._name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FacilitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
