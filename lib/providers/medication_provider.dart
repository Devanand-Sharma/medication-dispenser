import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medication_app/notifiers/medication_notifier.dart';
import 'package:medication_app/models/medication.dart';

final medicationProvider =
    AsyncNotifierProvider<MedicationNotifier, List<Medication>>(
  () {
    return MedicationNotifier();
  },
);
