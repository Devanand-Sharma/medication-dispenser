import 'package:hive/hive.dart';
import 'package:medication_app/models/dose.dart';

part 'dose_schedule.g.dart';

@HiveType(typeId: 2)
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
  String interval;
}