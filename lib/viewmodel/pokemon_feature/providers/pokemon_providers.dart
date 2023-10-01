import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_case_study/core/network_manager/cancel_token_ref.dart';
import 'package:pokedex_case_study/model/pokemon/details/pokemon_details_model.dart';
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart';
import 'package:pokedex_case_study/viewmodel/pokemon_feature/providers/pagination_model.dart';
import 'package:pokedex_case_study/viewmodel/pokemon_feature/repositories/pokemon_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_providers.g.dart';

final isLastPageProvider = StateProvider<bool>((ref) {
  return false;
});

@riverpod
class PokemonList extends _$PokemonList {
  PokemonPagination pagination = const PokemonPagination(offset: 0, limit: 20);

  @override
  FutureOr<List<Pokemon>> build() {
    return ref
        .read(pokemonRepositoryProvider)
        .fetchPokemonsPagination(offset: pagination.offset, limit: pagination.limit, cancelToken: ref.cancelToken());
  }

  //Fetch next page of pokemons
  Future<List<Pokemon>> fetchNextPage() async {
    state = const AsyncLoading();
    pagination = pagination.copyWith(offset: pagination.offset + pagination.limit);
    final pokemons = await ref
        .read(pokemonRepositoryProvider)
        .fetchPokemonsPagination(offset: pagination.offset, limit: pagination.limit, cancelToken: ref.cancelToken());
    if (pokemons.isEmpty) {
      ref.read(isLastPageProvider.notifier).state = true;
      return pokemons;
    }
    // Add new pokemons to the list
    state = AsyncData((state.value ?? []) + pokemons);
    return pokemons;
  }
}

final pokemonDetailProvider = FutureProvider.autoDispose.family<PokemonDetailsModel, String>((ref, detailUrl) async {
  return ref.watch(pokemonRepositoryProvider).fetchPokemon(detailUrl, cancelToken: ref.cancelToken());
});

final detailTitleOpacityProvider = StateProvider<bool>((ref) {
  return false;
});
