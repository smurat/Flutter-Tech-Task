import 'package:hive_flutter/adapters.dart';
import 'package:pokedex_case_study/constants/storage_constats/storage_constants.dart';
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart';
import 'package:pokedex_case_study/utils/logger.dart';

abstract final class HiveInitializer {
  static Future initHiveDependencies() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(PokemonAdapter());
      await Hive.openBox<Pokemon>(StorageConstants.hiveFavBox);
    } catch (e, s) {
      logger.e("Hive Error:", error: e, stackTrace: s);
      await Hive.deleteFromDisk();
      return Future.error(e, s);
    }
  }
}
