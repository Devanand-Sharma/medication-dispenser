// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicationAdapter extends TypeAdapter<Medication> {
  @override
  final int typeId = 1;

  @override
  Medication read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Medication(
      doseSchedule: fields[0] as DoseSchedule,
      color: fields[1] as String?,
      form: fields[2] as String?,
      image: fields[3] as String?,
      storageInstructions: fields[4] as String?,
      specialInstructions: fields[5] as String?,
      vector: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Medication obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.doseSchedule)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.form)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.storageInstructions)
      ..writeByte(5)
      ..write(obj.specialInstructions)
      ..writeByte(6)
      ..write(obj.vector);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
