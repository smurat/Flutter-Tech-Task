import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_case_study/core/router/app_router.gr.dart';
import 'package:pokedex_case_study/core/storage_manager/storage_manager.dart';
import 'package:pokedex_case_study/view/pokemon_list/widgets/cached_network_image_widget.dart';
import 'package:pokedex_case_study/view/pokemon_list/widgets/favourite_widget.dart';
import 'package:pokedex_case_study/viewmodel/pokemon_feature/providers/pokemon_providers.dart';

@RoutePage()
class FavouritePokemonsView extends HookConsumerWidget {
  const FavouritePokemonsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favHivePokemons = ref.watch(hiveStorageManagerProvider);
    final scrollController = useScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Pokemons'),
      ),
      body: favHivePokemons.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('No Favourite Pokemons', style: TextStyle(fontSize: 20)),
            );
          }
          return GridView.builder(
            controller: scrollController,
            physics: ref.watch(pokemonListProvider).isLoading ? const NeverScrollableScrollPhysics() : null,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final pokemon = data[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  InkWell(
                    onTap: () {
                      context.router.push(
                        PokemonDetailsRoute(pokemon: pokemon),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: CachedNetworkImageWidget(pokemon: pokemon),
                          ),
                          Text(pokemon.name?.toUpperCase() ?? ''),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final favHiveBox = ref.watch(hiveStorageManagerProvider);
                        return FavouriteButton(
                          key: ValueKey(pokemon.name),
                          isFavorite: favHiveBox.value?.contains(pokemon) ?? false,
                          onPressed: () {
                            ref.read(hiveStorageManagerProvider.notifier).toggleFavPokemons(pokemon);
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
