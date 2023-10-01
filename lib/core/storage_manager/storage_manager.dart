import 'package:pokedex_case_study/constants/storage_constats/storage_constants.dart';
import 'package:pokedex_case_study/core/storage_manager/storage_servive.dart';
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_manager.g.dart';

@riverpod
class HiveStorageManager extends _$HiveStorageManager {
  @override
  FutureOr<List<Pokemon>> build() async {
    final hiveStoragePr = ref.watch(hiveStorageServiceProvider);
    final pokeFavList = await hiveStoragePr.getItems<Pokemon>(StorageConstants.hiveFavBox);
    return pokeFavList;
  }

  //Add pokemon value to hive box and return list
  Future<List<Pokemon>> add(Pokemon pokemon) async {
    final hiveStoragePr = ref.watch(hiveStorageServiceProvider);
    await hiveStoragePr.addItemtoBox<Pokemon>(pokemon, StorageConstants.hiveFavBox);
    final List<Pokemon> pokemons = await hiveStoragePr.getItems<Pokemon>(StorageConstants.hiveFavBox);
    state = AsyncData(pokemons);
    return pokemons;
  }

  //Remove pokemon value from hive box and return list

  Future<List<Pokemon>> remove(Pokemon pokemon) async {
    final hiveStoragePr = ref.watch(hiveStorageServiceProvider);
    await hiveStoragePr.removeItemFromBox<Pokemon>(pokemon, StorageConstants.hiveFavBox);
    final List<Pokemon> pokemons = await hiveStoragePr.getItems<Pokemon>(StorageConstants.hiveFavBox);
    state = AsyncData(pokemons);
    return pokemons;
  }

  //Toggle pokemon value from hive box and return list
  Future<List<Pokemon>> toggleFavPokemons(Pokemon pokemon) async {
    final hiveStoragePr = ref.watch(hiveStorageServiceProvider);
    final isPokemonFavorited = state.value?.contains(pokemon) ?? false;
    if (isPokemonFavorited) {
      await hiveStoragePr.removeItemFromBox<Pokemon>(pokemon, StorageConstants.hiveFavBox);
    } else {
      await hiveStoragePr.addItemtoBox<Pokemon>(pokemon, StorageConstants.hiveFavBox);
    }
    final List<Pokemon> pokemons = await hiveStoragePr.getItems<Pokemon>(StorageConstants.hiveFavBox);
    state = AsyncData(pokemons);
    return pokemons;
  }
}
