import 'package:hive/hive.dart';

abstract class HiveManager {
  static Future<Box<E>> _openBox<E>(String boxName) async {
    // open/get the box
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    }
    return Hive.openBox(boxName);
  }

  static Future<Box<E>> getBox<E>(String boxName) async {
    // open/get the box
    return await _openBox(boxName);
  }

  static Future<void> add<E>(String boxName, E item) async {
    // add to a box
    final box = await _openBox(boxName);
    box.add(item);
  }

  static Future<E?> get<E>(String boxName, dynamic key) async {
    // get from a box
    final box = await _openBox(boxName);
    return box.get(key);
  }
}