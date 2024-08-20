import 'package:hive/hive.dart';
import 'package:medication_app/database_manager/models/dose.dart';

part 'dose_schedule.g.dart';

@HiveType(typeId: 5)
enum DosageInterval {
  @HiveField(0)
  hour,
  @HiveField(1)
  day,
  @HiveField(2)
  week,
  @HiveField(3)
  month,
}

extension DosageToString on DosageInterval {
  String get label {
    switch (this) {
      case DosageInterval.hour:
        return 'Hourly';
      case DosageInterval.day:
        return 'Daily';
      case DosageInterval.week:
        return 'Weekly';
      case DosageInterval.month:
        return 'Monthly';
      default:
        return 'Daily';
    }
  }
}

DosageInterval parseDosageInterval(String interval) {
  switch (interval) {
    case 'Hourly':
      return DosageInterval.hour;
    case 'Daily':
      return DosageInterval.day;
    case 'Weekly':
      return DosageInterval.week;
    case 'Monthly':
      return DosageInterval.month;
    default:
      throw ArgumentError('Invalid DosageInterval: $interval');
  }
}

@HiveType(typeId: 4)
class DoseSchedule with HiveObjectMixin {
  DoseSchedule({
    required this.dose,
    required this.frequency,
    required this.interval,
  });

  @HiveField(0)
  Dose dose;

  @HiveField(1)
  int frequency;

  @HiveField(2)
  DosageInterval interval;
}
