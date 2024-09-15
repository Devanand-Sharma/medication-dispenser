class Prescription {
  Prescription({
    required this.totalQuantity,
    required this.remainingQuantity,
    required this.thresholdQuantity,
    this.refillDates = const [],
    this.isRefillReminder = true,
  });

  int totalQuantity;
  int remainingQuantity;
  int thresholdQuantity;
  List<DateTime>? refillDates;
  bool isRefillReminder;
}
