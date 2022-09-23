// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceAdapter extends TypeAdapter<Price> {
  @override
  final int typeId = 4;

  @override
  Price read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Price()
      .._additionalChildrenFee = fields[0] as int?
      .._additionalGuestsFee = fields[1] as int?
      .._additionalInfantsFee = fields[2] as int?
      .._checkinTime = fields[3] as String?
      .._checkoutTime = fields[4] as String?
      .._cleaningFee = fields[5] as int?
      .._currencyCode = fields[6] as String?
      .._monthlyPrice = fields[7] as int?
      .._nightlyPrice = fields[8] as int?
      .._note = fields[9] as String?
      .._securityFee = fields[10] as int?
      .._standardChildren = fields[11] as int?
      .._standardGuests = fields[12] as int?
      .._standardInfants = fields[13] as int?
      .._weekendPrice = fields[14] as int?;
  }

  @override
  void write(BinaryWriter writer, Price obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj._additionalChildrenFee)
      ..writeByte(1)
      ..write(obj._additionalGuestsFee)
      ..writeByte(2)
      ..write(obj._additionalInfantsFee)
      ..writeByte(3)
      ..write(obj._checkinTime)
      ..writeByte(4)
      ..write(obj._checkoutTime)
      ..writeByte(5)
      ..write(obj._cleaningFee)
      ..writeByte(6)
      ..write(obj._currencyCode)
      ..writeByte(7)
      ..write(obj._monthlyPrice)
      ..writeByte(8)
      ..write(obj._nightlyPrice)
      ..writeByte(9)
      ..write(obj._note)
      ..writeByte(10)
      ..write(obj._securityFee)
      ..writeByte(11)
      ..write(obj._standardChildren)
      ..writeByte(12)
      ..write(obj._standardGuests)
      ..writeByte(13)
      ..write(obj._standardInfants)
      ..writeByte(14)
      ..write(obj._weekendPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
