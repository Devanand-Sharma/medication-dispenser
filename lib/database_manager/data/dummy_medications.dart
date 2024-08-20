import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medication_app/database_manager/models/dose.dart';
import 'package:medication_app/database_manager/models/medication.dart';
import 'package:medication_app/database_manager/models/dose_schedule.dart';
import 'package:medication_app/providers/medication_provider.dart';

void createDummyMedications(WidgetRef ref) async {
  var dummyMedications = [
    Medication(
      doseSchedule: DoseSchedule(
        dose: Dose(count: 1, unit: 'pills'),
        frequency: 1,
        interval: DosageInterval.day,
      ),
      name: 'Metformin',
      route: MedicationRoute.oral,
      condition: 'Diabetes',
      count: 30,
    ),
    Medication(
      doseSchedule: DoseSchedule(
        dose: Dose(count: 2, unit: 'pills'),
        frequency: 1,
        interval: DosageInterval.month,
      ),
      name: 'Lisinopril',
      route: MedicationRoute.anal,
      condition: 'High Blood Pressure',
      count: 15,
    ),
    Medication(
      doseSchedule: DoseSchedule(
        dose: Dose(count: 3, unit: 'pills'),
        frequency: 1,
        interval: DosageInterval.week,
      ),
      name: 'Atorvastatin',
      route: MedicationRoute.inhalation,
      condition: 'High Cholesterol',
      count: 50,
    ),
    Medication(
      doseSchedule: DoseSchedule(
        dose: Dose(count: 2, unit: 'pills'),
        frequency: 1,
        interval: DosageInterval.day,
      ),
      name: 'Metoprolol',
      route: MedicationRoute.injection,
      condition: 'High Blood Pressure',
      count: 100,
    ),
  ];

  final medicationNotifier = ref.read(medicationProvider.notifier);

  // Clear Medications
  await medicationNotifier.clearMedications();

  // Add Medications if Box Empty
  if (await medicationNotifier.getMedicationCount() == 0) {
    for (var medication in dummyMedications) {
      await medicationNotifier.addMedication(medication);
    }
  }

  // List All Medications
  final medications = ref.watch(medicationProvider);
  print('Number of Medications: ${medications.length}');
  for (var i = 0; i < medications.length; i++) {
    print(medications[i].name);
  }
}
