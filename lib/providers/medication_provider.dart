import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_app/database_manager/models/medication.dart';
import 'package:medication_app/notifiers/medication_notifier.dart';

final medicationProvider =
    StateNotifierProvider<MedicationNotifier, List<Medication>>(
  (ref) => MedicationNotifier(),
);
