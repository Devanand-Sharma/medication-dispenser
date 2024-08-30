import 'package:hive/hive.dart';
import 'package:medication_app/database_manager/models/user.dart';

class UserUtils {
  static Future<void> createDummyUser() async {
    final dummyUser = User(
      email: 'test@example.com',
      password: 'password123',
      firstName: 'John',
      lastName: 'Doe',
      birthday: DateTime(1990, 1, 1),
      gender: 'Male',
    );

    final userBox = await Hive.openBox<User>('users');
    await userBox.add(dummyUser);
  }

  static Future<void> printAllUsers() async {
    final userBox = await Hive.openBox<User>('users');
    print('Total users: ${userBox.length}');
    for (var i = 0; i < userBox.length; i++) {
      final user = userBox.getAt(i);
      print('User $i: Email: ${user?.email}, Name: ${user?.firstName} ${user?.lastName}');
    }
  }

  static Future<List<User>> getAllUsers() async {
    final userBox = await Hive.openBox<User>('users');
    return userBox.values.toList();
  }

  static Future<void> deleteAllUsers() async {
    final userBox = await Hive.openBox<User>('users');
    await userBox.clear();
  }
}