import 'package:hive/hive.dart';
import 'package:medication_app/database_manager/models/dose_schedule.dart';

part 'medication.g.dart';

@HiveType(typeId: 2)
enum MedicationRoute {
  @HiveField(0)
  oral,
  @HiveField(1)
  injection,
  @HiveField(2)
  inhalation,
  @HiveField(3)
  anal,
}

extension MedicationRouteExtension on MedicationRoute {
  String get label {
    switch (this) {
      case MedicationRoute.oral:
        return 'Oral';
      case MedicationRoute.injection:
        return 'Injection';
      case MedicationRoute.inhalation:
        return 'Inhalation';
      case MedicationRoute.anal:
        return 'Anal';
      default:
        return '';
    }
  }
}

MedicationRoute parseMedicationRoute(String route) {
  switch (route) {
    case 'Oral':
      return MedicationRoute.oral;
    case 'Injection':
      return MedicationRoute.injection;
    case 'Inhalation':
      return MedicationRoute.inhalation;
    case 'Anal':
      return MedicationRoute.anal;
    default:
      throw ArgumentError('Invalid MedicationRoute: $route');
  }
}

@HiveType(typeId: 1)
class Medication with HiveObjectMixin {
  Medication({
    // required this.id,
    required this.doseSchedule,
    required this.name,
    required this.condition,
    required this.route,
    this.count,
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
  String name;

  @HiveField(2)
  String condition;

  @HiveField(3)
  MedicationRoute route;

  @HiveField(4)
  int? count;

  @HiveField(5)
  String? color;

  @HiveField(6)
  String? form;

  @HiveField(7)
  String? image;

  @HiveField(8)
  String? storageInstructions;

  @HiveField(9)
  String? specialInstructions;

  @HiveField(10)
  String? vector;
}
