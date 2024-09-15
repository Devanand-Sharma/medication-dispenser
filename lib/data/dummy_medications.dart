import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:medication_app/models/medication.dart';
import 'package:medication_app/models/medication_route.dart';
import 'package:medication_app/models/medication_frequency.dart';
import 'package:medication_app/models/prescription.dart';
import 'package:medication_app/models/dosage.dart';

List<Medication> createDummyMedications() {
  const uuid = Uuid();

  var dummyMedications = [
    Medication(
      id: uuid.v4(),
      name: 'Metroutein',
      condition: 'Diabetes',
      route: MedicationRoute.tablet,
      dose: 1,
      dosage: Dosage(
        frequency: MedicationFrequency.onceADay,
        scheduledTimes: [
          const TimeOfDay(hour: 2, minute: 59),
        ],
        startDate: DateTime(2024, 9, 1, 2, 59),
      ),
      prescription: Prescription(
          totalQuantity: 1000,
          remainingQuantity: 500,
          thresholdQuantity: 10,
          isRefillReminder: true),
    ),
    Medication(
      id: uuid.v4(),
      name: 'Lisinopril',
      condition: 'High Blood Pressure',
      route: MedicationRoute.tablet,
      dose: 2,
      dosage: Dosage(
        frequency: MedicationFrequency.onceADay,
        scheduledTimes: [
          const TimeOfDay(hour: 2, minute: 59),
        ],
        startDate: DateTime(2024, 9, 1, 2, 59),
      ),
      prescription: Prescription(
          totalQuantity: 1000,
          remainingQuantity: 500,
          thresholdQuantity: 10,
          isRefillReminder: true),
    ),
    Medication(
      id: uuid.v4(),
      name: 'Atorvastatin',
      condition: 'High Cholesterol',
      route: MedicationRoute.tablet,
      dose: 1,
      dosage: Dosage(
        frequency: MedicationFrequency.onceADay,
        scheduledTimes: [
          const TimeOfDay(hour: 2, minute: 59),
        ],
        startDate: DateTime(2024, 9, 1, 2, 59),
        endDate: DateTime(2024, 9, 19, 2, 59),
      ),
      prescription: Prescription(
        totalQuantity: 1000,
        remainingQuantity: 500,
        thresholdQuantity: 10,
      ),
    ),
    Medication(
      id: uuid.v4(),
      name: 'Metoprolol',
      condition: 'High Blood Pressure',
      route: MedicationRoute.tablet,
      dose: 1,
      dosage: Dosage(
        frequency: MedicationFrequency.onceADay,
        scheduledTimes: [
          const TimeOfDay(hour: 2, minute: 59),
        ],
        startDate: DateTime(2024, 9, 1, 2, 59),
      ),
      prescription: Prescription(
          totalQuantity: 1000,
          remainingQuantity: 500,
          thresholdQuantity: 10,
          isRefillReminder: true),
    ),
  ];

  // List All Medications
  // final medications = ref.watch(medicationProvider);
  // print('Number of Medications: ${dummyMedications.length}');
  // for (var i = 0; i < dummyMedications.length; i++) {
  //   print(dummyMedications[i].name);
  // }

  return dummyMedications;
}
