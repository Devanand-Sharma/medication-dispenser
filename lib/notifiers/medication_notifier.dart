import 'package:flutter/material.dart';

import 'package:medication_app/models/medication.dart';

class MedicationNotifier extends ChangeNotifier {
  List<Medication> medications = [];

  MedicationNotifier({
    required this.medications,
  });

  int get medicationCount {
    return medications.length;
  }

  Medication getMedication(String id) {
    return medications.firstWhere((e) => e.id == id);
  }

  Medication addMedication(Medication medication) {
    medications = [...medications, medication];
    notifyListeners();
    return medication;
  }

  Medication removeMedication(Medication medication) {
    medications = medications.where((e) => e.id != medication.id).toList();
    notifyListeners();
    return medication;
  }

  Medication updateMedication(Medication medication) {
    medications =
        medications.map((e) => e.id == medication.id ? medication : e).toList();
    notifyListeners();
    return medication;
  }

  void clearMedications() {
    medications = [];
    notifyListeners();
  }
}
