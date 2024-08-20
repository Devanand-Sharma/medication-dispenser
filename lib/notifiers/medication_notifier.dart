import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medication_app/database_manager/hive_manager.dart';
import 'package:medication_app/database_manager/models/medication.dart';

class MedicationNotifier extends StateNotifier<List<Medication>> {
  MedicationNotifier() : super([]) {
    getMedications();
  }

  Future<void> getMedications() async {
    final medications =
        await HiveManager.getAll<Medication>(BoxNames.medications);
    state = medications;
  }

  Future<int> getMedicationCount() async {
    return await HiveManager.getLength<Medication>(BoxNames.medications);
  }

  Future<void> addMedication(Medication medication) async {
    state = [...state, medication];
    await HiveManager.add<Medication>(BoxNames.medications, medication);
  }

  Future<void> removeMedication(Medication medication) async {
    state = state.where((e) => e.key != medication.key).toList();
    await HiveManager.delete<Medication>(BoxNames.medications, medication.key);
  }

  Future<void> updateMedication(int key, Medication medication) async {
    state = state.map((e) => e.key == key ? medication : e).toList();
    await HiveManager.update<Medication>(BoxNames.medications, key, medication);
  }

  Future<void> clearMedications() async {
    state = [];
    await HiveManager.clear<Medication>(BoxNames.medications);
  }
}
