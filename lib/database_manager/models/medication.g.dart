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
      name: fields[1] as String,
      condition: fields[2] as String,
      route: fields[3] as MedicationRoute,
      count: fields[4] as int?,
      color: fields[5] as String?,
      form: fields[6] as String?,
      image: fields[7] as String?,
      storageInstructions: fields[8] as String?,
      specialInstructions: fields[9] as String?,
      vector: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Medication obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.doseSchedule)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.condition)
      ..writeByte(3)
      ..write(obj.route)
      ..writeByte(4)
      ..write(obj.count)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.form)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.storageInstructions)
      ..writeByte(9)
      ..write(obj.specialInstructions)
      ..writeByte(10)
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

class MedicationRouteAdapter extends TypeAdapter<MedicationRoute> {
  @override
  final int typeId = 2;

  @override
  MedicationRoute read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MedicationRoute.oral;
      case 1:
        return MedicationRoute.injection;
      case 2:
        return MedicationRoute.inhalation;
      case 3:
        return MedicationRoute.anal;
      default:
        return MedicationRoute.oral;
    }
  }

  @override
  void write(BinaryWriter writer, MedicationRoute obj) {
    switch (obj) {
      case MedicationRoute.oral:
        writer.writeByte(0);
        break;
      case MedicationRoute.injection:
        writer.writeByte(1);
        break;
      case MedicationRoute.inhalation:
        writer.writeByte(2);
        break;
      case MedicationRoute.anal:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicationRouteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
