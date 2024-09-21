enum MedicationFrequency {
  onceADay,
  xTimesADay,
  everyXHours,
  everyXDays,
  everyXWeeks,
  everyXMonths,
  // TODO: Add support for onARecurringCycle
  // onARecurringCycle,
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
      // case MedicationFrequency.onARecurringCycle:
      //   return 'On a Recurring Cycle';
      case MedicationFrequency.onlyAsNeeded:
        return 'Only as Needed';
    }
  }
}

bool isFrequencyCount(MedicationFrequency? frequency) {
  switch (frequency) {
    case MedicationFrequency.xTimesADay:
      return true;
    case MedicationFrequency.everyXHours:
      return true;
    case MedicationFrequency.everyXDays:
      return true;
    case MedicationFrequency.everyXWeeks:
      return true;
    case MedicationFrequency.everyXMonths:
      return true;
    default:
      return false;
  }
}

bool isEveryX(MedicationFrequency? frequency) {
  switch (frequency) {
    case MedicationFrequency.everyXHours:
      return true;
    case MedicationFrequency.everyXDays:
      return true;
    case MedicationFrequency.everyXWeeks:
      return true;
    case MedicationFrequency.everyXMonths:
      return true;
    default:
      return false;
  }
}

int? setMedicationFrequencyCount(MedicationFrequency? value) {
  switch (value) {
    case MedicationFrequency.xTimesADay:
      return 2;
    case MedicationFrequency.everyXHours:
      return 2;
    case MedicationFrequency.everyXDays:
      return 2;
    case MedicationFrequency.everyXWeeks:
      return 1;
    case MedicationFrequency.everyXMonths:
      return 1;
    default:
      return null;
  }
}

int setMinMedicationFrequencyCount(MedicationFrequency? value) {
  switch (value) {
    case MedicationFrequency.xTimesADay:
      return 2;
    case MedicationFrequency.everyXHours:
      return 1;
    case MedicationFrequency.everyXDays:
      return 2;
    case MedicationFrequency.everyXWeeks:
      return 1;
    case MedicationFrequency.everyXMonths:
      return 1;
    default:
      return 1;
  }
}

int setMaxMedicationFrequencyCount(MedicationFrequency? value) {
  switch (value) {
    case MedicationFrequency.xTimesADay:
      return 6;
    case MedicationFrequency.everyXHours:
      return 1;
    case MedicationFrequency.everyXDays:
      return 60;
    case MedicationFrequency.everyXWeeks:
      return 12;
    case MedicationFrequency.everyXMonths:
      return 12;
    default:
      return 1;
  }
}
