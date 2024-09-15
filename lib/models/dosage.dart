import 'package:flutter/material.dart';

import 'package:medication_app/models/administered_times.dart';
import 'package:medication_app/models/medication_frequency.dart';

class Dosage {
  Dosage({
    required this.frequency,
    this.frequencyCount,
    required this.scheduledTimes,
    this.administeredTimes = const [],
    required this.startDate,
    this.endDate,
    this.isReminder = true,
  });

  MedicationFrequency frequency;
  int? frequencyCount;
  List<TimeOfDay> scheduledTimes;
  List<AdministeredTime> administeredTimes;
  DateTime startDate;
  DateTime? endDate;
  bool isReminder;
}
