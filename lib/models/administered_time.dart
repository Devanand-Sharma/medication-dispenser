import 'package:medication_app/models/administered_status.dart';

class AdministeredTime {
  AdministeredTime({
    required this.time,
    required this.status,
    required this.medicationId,
  });

  DateTime time;
  AdministeredStatus status;
  int medicationId;
}
