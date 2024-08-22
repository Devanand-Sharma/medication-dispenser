import 'package:hive/hive.dart';

part 'dose.g.dart';

@HiveType(typeId: 3)
class Dose with HiveObjectMixin {
  Dose({
    required this.count,
    required this.unit,
  });

  @HiveField(0)
  double count;

  @HiveField(1)
  String unit;
}