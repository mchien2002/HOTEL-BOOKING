// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HotelDataAdapter extends TypeAdapter<HotelData> {
  @override
  final int typeId = 9;

  @override
  HotelData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HotelData()
      .._address = fields[0] as String?
      .._banner = fields[1] as String?
      .._city = fields[2] as City?
      .._content = fields[3] as String?
      .._createdAt = fields[4] as String?
      .._currentPrice = fields[5] as int?
      .._description = fields[6] as String?
      .._email = fields[7] as String?
      .._facilities = (fields[8] as List?)?.cast<Facilities>()
      .._id = fields[9] as String?
      .._isFavorite = fields[10] as bool?
      .._name = fields[11] as String?
      .._numberOfFavorite = fields[12] as int?
      .._phone = fields[13] as String?
      .._photos = (fields[14] as List?)?.cast<String>()
      .._ratings = fields[15] as int?
      .._roomTypes = (fields[16] as List?)?.cast<RoomType>();
  }

  @override
  void write(BinaryWriter writer, HotelData obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj._address)
      ..writeByte(1)
      ..write(obj._banner)
      ..writeByte(2)
      ..write(obj._city)
      ..writeByte(3)
      ..write(obj._content)
      ..writeByte(4)
      ..write(obj._createdAt)
      ..writeByte(5)
      ..write(obj._currentPrice)
      ..writeByte(6)
      ..write(obj._description)
      ..writeByte(7)
      ..write(obj._email)
      ..writeByte(8)
      ..write(obj._facilities)
      ..writeByte(9)
      ..write(obj._id)
      ..writeByte(10)
      ..write(obj._isFavorite)
      ..writeByte(11)
      ..write(obj._name)
      ..writeByte(12)
      ..write(obj._numberOfFavorite)
      ..writeByte(13)
      ..write(obj._phone)
      ..writeByte(14)
      ..write(obj._photos)
      ..writeByte(15)
      ..write(obj._ratings)
      ..writeByte(16)
      ..write(obj._roomTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
