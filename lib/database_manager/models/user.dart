import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 6)
class User extends HiveObject {
  @HiveField(0)
  String email;

  @HiveField(1)
  String password;

  @HiveField(2)
  String? firstName;

  @HiveField(3)
  String? lastName;

  @HiveField(4)
  DateTime? dateOfBirth;

  @HiveField(5)
  String? gender;

  User({
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
  });
}