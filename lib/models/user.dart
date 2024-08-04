import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User with HiveObjectMixin {
  User({
    required this.fname,
    required this.lname,
    required this.medications,
  });

  @HiveField(0)
  String fname;

  @HiveField(1)
  String lname;

  @HiveField(2)
  HiveList medications;
}