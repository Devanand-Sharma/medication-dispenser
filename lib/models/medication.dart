import 'package:medication_app/models/dosage.dart';
import 'package:medication_app/models/medication_route.dart';
import 'package:medication_app/models/prescription.dart';

class Medication {
  Medication({
    required this.id,
    required this.name,
    required this.condition,
    required this.route,
    required this.dose,
    required this.prescription,
    required this.dosage,
    this.instructions,
    this.image,
    this.color,
  });

  String id;
  String name;
  String condition;
  MedicationRoute route;
  int dose;
  Dosage dosage;
  Prescription prescription;
  String? instructions;

  String? image;
  String? color;
}
