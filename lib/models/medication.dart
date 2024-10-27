import 'package:medication_app/models/medication_route.dart';
import 'package:medication_app/models/medication_frequency.dart';
import 'package:medication_app/models/administered_time.dart';
import 'package:medication_app/models/refill_date.dart';
import 'package:medication_app/models/scheduled_time.dart';
import 'package:medication_app/utils/dates.dart';

class Medication {
  Medication({
    required this.id,
    required this.name,
    required this.condition,
    required this.route,
    required this.dose,
    required this.totalQuantity,
    required this.remainingQuantity,
    required this.thresholdQuantity,
    this.isRefillReminder = true,
    required this.frequency,
    this.frequencyCount,
    required this.startDate,
    this.endDate,
    this.isReminder = true,
    this.instructions,
    required this.scheduledTimes,
    required this.administeredTimes,
    required this.refillDates,
  });

  int id;
  String name;
  String condition;
  MedicationRoute route;
  int dose;
  int totalQuantity;
  int remainingQuantity;
  int thresholdQuantity;
  bool isRefillReminder;
  MedicationFrequency frequency;
  int? frequencyCount;
  DateTime startDate;
  DateTime? endDate;
  bool isReminder;
  String? instructions;

  List<ScheduledTime> scheduledTimes;
  List<AdministeredTime> administeredTimes;
  List<RefillDate> refillDates;

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['ID'],
      name: json['name'],
      condition: json['condition'],
      route: MedicationRoute.values[json['route']],
      dose: json['dose'],
      totalQuantity: json['total_quantity'],
      remainingQuantity: json['remaining_quantity'],
      thresholdQuantity: json['threshold_quantity'],
      isRefillReminder: json['is_refill_reminder'],
      frequency: MedicationFrequency.values[json['frequency']],
      frequencyCount: json['frequency_count'],
      startDate: DateTime.parse(json['start_date']),
      endDate:
          json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      isReminder: json['is_reminder'],
      instructions: json['instructions'],
      scheduledTimes: json['scheduled_times']
          .map<ScheduledTime>((e) => ScheduledTime.fromJson(e))
          .toList(),
      administeredTimes: [],
      refillDates: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'condition': condition,
      'route': route.index,
      'dose': dose,
      'total_quantity': totalQuantity,
      'remaining_quantity': remainingQuantity,
      'threshold_quantity': thresholdQuantity,
      'is_refill_reminder': isRefillReminder,
      'frequency': frequency.index,
      'frequency_count': frequencyCount,
      'start_date': toCustomIso8601String(startDate),
      'end_date': endDate != null ? toCustomIso8601String(endDate!) : null,
      'is_reminder': isReminder,
      'instructions': instructions,
      'scheduled_times': scheduledTimes.map((e) => e.toJson()).toList(),
    };
  }
}
