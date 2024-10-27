import 'package:flutter/material.dart';

DateTime timeToDate(TimeOfDay time) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day, time.hour, time.minute);
}

String toCustomIso8601String(DateTime dateTime) {
  return '${dateTime.toUtc().toIso8601String().split('.').first}Z';
}
