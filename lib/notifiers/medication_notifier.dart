import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medication_app/database_manager/hive_manager.dart';
import 'package:medication_app/database_manager/models/medication.dart';
import 'package:medication_app/models/operation_status.dart';

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

  Future<OperationStatus> addMedication(Medication medication) async {
    try {
      state = [...state, medication];
      await HiveManager.add<Medication>(BoxNames.medications, medication);
      return OperationStatus.success;
    } catch (e) {
      print('Error adding medication: $e');
      return OperationStatus.failure;
    }
  }

  Future<OperationStatus> removeMedication(Medication medication) async {
    try {
      state = state.where((e) => e.key != medication.key).toList();
      await HiveManager.delete<Medication>(
          BoxNames.medications, medication.key);
      return OperationStatus.success;
    } catch (e) {
      print('Error removing medication: $e');
      return OperationStatus.failure;
    }
  }

  Future<OperationStatus> updateMedication(
      int key, Medication medication) async {
    try {
      state = state.map((e) => e.key == key ? medication : e).toList();
      await HiveManager.update<Medication>(
          BoxNames.medications, key, medication);
      return OperationStatus.success;
    } catch (e) {
      print('Error updating medication: $e');
      return OperationStatus.failure;
    }
  }

  Future<OperationStatus> clearMedications() async {
    try {
      await HiveManager.clear<Medication>(BoxNames.medications);
      state = [];
      return OperationStatus.success;
    } catch (e) {
      print('Error clearing medications: $e');
      return OperationStatus.failure;
    }
  }
}
