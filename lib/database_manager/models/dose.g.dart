// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoseAdapter extends TypeAdapter<Dose> {
  @override
  final int typeId = 3;

  @override
  Dose read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dose(
      count: fields[0] as double,
      unit: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Dose obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
