import 'package:flutter/material.dart';

import 'package:medication_app/utils/dates.dart';

class ScheduledTime {
  ScheduledTime({
    required this.id,
    required this.time,
    required this.medicationId,
  });

  int id;
  TimeOfDay time;
  int medicationId;

  factory ScheduledTime.fromJson(Map<String, dynamic> json) {
    final dateTime = DateTime.parse(json['time']);

    return ScheduledTime(
      id: json['ID'],
      time: TimeOfDay.fromDateTime(dateTime),
      medicationId: json['medication_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': toCustomIso8601String(timeToDate(time)),
    };
  }
}
