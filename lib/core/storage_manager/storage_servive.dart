import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex_case_study/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final hiveStorageServiceProvider = Provider<HiveStorageService>((ref) {
  return HiveStorageService();
});

class HiveStorageService {
  Future<Box<T>> openBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }

  Future<bool> isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  Future<void> addItemtoBox<T>(T item, String boxName, {dynamic key}) async {
    final openBox = await Hive.openBox<T>(boxName);
    if (key == null) {
      openBox.add(item);
    } else {
      // logger.i((key));
      // logger.i(ascii.encode(key));
      openBox.put(key, item);
    }
    logger.i(openBox.length);
  }

  Future removeItemFromBox<T>(T item, String boxName, {dynamic key}) async {
    final openBox = await Hive.openBox<T>(boxName);
    if (key == null) {
      var aktifKynList = await getItems<T>(boxName);
      final int index = aktifKynList.indexOf(item);
      openBox.deleteAt(index);
    } else {
      openBox.delete(key);
    }

    logger.d(openBox.keys);
  }

  Future<void> addItems<T>(List<T> items, String boxName) async {
    logger.d("adding boxes");
    final openBox = await Hive.openBox<T>(boxName);
    for (var item in items) {
      openBox.add(item);
    }
  }

  Future<void> replaceItems<T>(List<T> items, String boxName, String itemKey) async {
    logger.d("replacing boxes");
    final openBox = await Hive.openBox(boxName);
    for (var item in items) {
      openBox.put(item, item);
    }
  }

  Future<List<T>> getItems<T>(String boxName) async {
    List<T> boxList = [];

    final openBox = await Hive.openBox<T>(boxName);

    boxList = openBox.values.toList();

    return boxList;
  }
}
