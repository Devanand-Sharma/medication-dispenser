enum MedicationRoute {
  tablet,
  capsule,
  solutionTsp,
  solutionTbsp,
  drops,
  inhaler,
  injection,
  powder,
  other,
}

extension MedicationRouteExtension on MedicationRoute {
  String get name {
    switch (this) {
      case MedicationRoute.tablet:
        return 'Tablet';
      case MedicationRoute.capsule:
        return 'Capsule';
      case MedicationRoute.solutionTsp:
        return 'Solution (tsp / 5mL)';
      case MedicationRoute.solutionTbsp:
        return 'Solution (tbsp / 15mL)';
      case MedicationRoute.drops:
        return 'Drops';
      case MedicationRoute.inhaler:
        return 'Inhaler';
      case MedicationRoute.injection:
        return 'Injection';
      case MedicationRoute.powder:
        return 'Powder';
      case MedicationRoute.other:
        return 'Other';
    }
  }
}

String medicationRouteToUnit(MedicationRoute? form) {
  if (form == null) {
    return 'units';
  }

  switch (form) {
    case MedicationRoute.tablet:
      return 'pills';
    case MedicationRoute.capsule:
      return 'pills';
    case MedicationRoute.solutionTsp:
      return 'tsp';
    case MedicationRoute.solutionTbsp:
      return 'tbsp';
    case MedicationRoute.drops:
      return 'drops';
    case MedicationRoute.inhaler:
      return 'puffs';
    case MedicationRoute.injection:
      return 'injections';
    case MedicationRoute.powder:
      return 'mg';
    case MedicationRoute.other:
      return 'doses';
  }
}
