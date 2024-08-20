import 'package:hive/hive.dart';

abstract class BoxNames {
  static const String medications = 'medications';
  static const String doseSchedule = 'doseSchedule';
  static const String user = 'user';
  static const String dose = 'dose';
}

abstract class HiveManager {
  static Future<Box<E>> _openBox<E>(String boxName) async {
    // open/get the box
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<E>(boxName);
    }
    return Hive.openBox<E>(boxName);
  }

  static Future<Box<E>> getBox<E>(String boxName) async {
    // open/get the box
    return await _openBox<E>(boxName);
  }

  static Future<E?> get<E>(String boxName, dynamic key) async {
    // get from a box
    final box = await _openBox<E>(boxName);
    return box.get(key);
  }

  static Future<List<E>> getAll<E>(String boxName) async {
    // get all from a box
    final box = await _openBox<E>(boxName);
    return box.values.toList();
  }

  static Future<int> getLength<E>(String boxName) async {
    // get length of a box
    final box = await _openBox<E>(boxName);
    return box.length;
  }

  static Future<bool> isEmpty<E>(String boxName) async {
    // check if a box is empty
    final box = await _openBox<E>(boxName);
    return box.isEmpty;
  }

  static Future<void> add<E>(String boxName, E item) async {
    // add to a box
    final box = await _openBox<E>(boxName);
    await box.add(item);
  }

  static Future<void> update<E>(String boxName, dynamic key, E item) async {
    // update a box
    final box = await _openBox<E>(boxName);
    await box.put(key, item);
  }

  static Future<void> delete<E>(String boxName, dynamic key) async {
    // delete from a box
    final box = await _openBox<E>(boxName);
    await box.delete(key);
  }

  static Future<void> clear<E>(String boxName) async {
    // clear a box
    final box = await _openBox<E>(boxName);
    await box.clear();
  }
}
