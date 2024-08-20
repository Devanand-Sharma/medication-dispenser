// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dose_schedule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoseScheduleAdapter extends TypeAdapter<DoseSchedule> {
  @override
  final int typeId = 4;

  @override
  DoseSchedule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoseSchedule(
      dose: fields[0] as Dose,
      frequency: fields[1] as int,
      interval: fields[2] as DosageInterval,
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

class DosageIntervalAdapter extends TypeAdapter<DosageInterval> {
  @override
  final int typeId = 5;

  @override
  DosageInterval read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DosageInterval.hour;
      case 1:
        return DosageInterval.day;
      case 2:
        return DosageInterval.week;
      case 3:
        return DosageInterval.month;
      default:
        return DosageInterval.hour;
    }
  }

  @override
  void write(BinaryWriter writer, DosageInterval obj) {
    switch (obj) {
      case DosageInterval.hour:
        writer.writeByte(0);
        break;
      case DosageInterval.day:
        writer.writeByte(1);
        break;
      case DosageInterval.week:
        writer.writeByte(2);
        break;
      case DosageInterval.month:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DosageIntervalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
