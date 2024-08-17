import 'package:hive/hive.dart';
import 'package:medication_app/database_manager/models/dose_schedule.dart';

part 'medication.g.dart';

@HiveType(typeId: 1)
class Medication with HiveObjectMixin {
  Medication({
    required this.doseSchedule,
    this.color,
    this.form,
    this.image,
    this.storageInstructions,
    this.specialInstructions,
    this.vector,
  });

  @HiveField(0)
  DoseSchedule doseSchedule;

  @HiveField(1)
  String? color;

  @HiveField(2)
  String? form;

  @HiveField(3)
  String? image;

  @HiveField(4)
  String? storageInstructions;

  @HiveField(5)
  String? specialInstructions;

  @HiveField(6)
  String? vector;
}