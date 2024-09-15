import 'package:medication_app/models/administered_status.dart';

class AdministeredTime {
  AdministeredTime({
    required this.time,
    required this.status,
    this.isReminder = true,
  });

  DateTime time;
  AdministeredStatus status;
  bool isReminder;
}
