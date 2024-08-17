// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose_schedule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoseScheduleAdapter extends TypeAdapter<DoseSchedule> {
  @override
  final int typeId = 2;

  @override
  DoseSchedule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoseSchedule(
      dose: fields[0] as Dose,
      frequency: fields[1] as int,
      interval: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DoseSchedule obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dose)
      ..writeByte(1)
      ..write(obj.frequency)
      ..writeByte(2)
      ..write(obj.interval);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoseScheduleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
