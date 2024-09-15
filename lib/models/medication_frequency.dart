enum MedicationFrequency {
  onceADay,
  xTimesADay,
  everyXHours,
  everyXDays,
  everyXWeeks,
  everyXMonths,
  onARecurringCycle,
  onlyAsNeeded,
}

extension MedicationFrequencyExtension on MedicationFrequency {
  String get name {
    switch (this) {
      case MedicationFrequency.onceADay:
        return 'Once a Day';
      case MedicationFrequency.xTimesADay:
        return 'X Times a Day';
      case MedicationFrequency.everyXHours:
        return 'Every X Hours';
      case MedicationFrequency.everyXDays:
        return 'Every X Days';
      case MedicationFrequency.everyXWeeks:
        return 'Every X Weeks';
      case MedicationFrequency.everyXMonths:
        return 'Every X Months';
      case MedicationFrequency.onARecurringCycle:
        return 'On a Recurring Cycle';
      case MedicationFrequency.onlyAsNeeded:
        return 'Only as Needed';
    }
  }
}
