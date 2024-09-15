import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medication_app/data/dummy_medications.dart';

import 'package:medication_app/notifiers/medication_notifier.dart';

final medicationProvider = ChangeNotifierProvider<MedicationNotifier>(
  (ref) => MedicationNotifier(medications: createDummyMedications()),
);
