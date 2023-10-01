import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_case_study/core/router/app_router.gr.dart';
import 'package:pokedex_case_study/core/storage_manager/storage_manager.dart';
import 'package:pokedex_case_study/utils/debouncer.dart';
import 'package:pokedex_case_study/utils/logger.dart';
import 'package:pokedex_case_study/view/pokemon_list/widgets/cached_network_image_widget.dart';
import 'package:pokedex_case_study/view/pokemon_list/widgets/favoroute_badge_widget.dart';
import 'package:pokedex_case_study/view/pokemon_list/widgets/favourite_widget.dart';
import 'package:pokedex_case_study/viewmodel/pokemon_feature/providers/pokemon_providers.dart';

@RoutePage()
class PokemonListView extends StatefulHookConsumerWidget {
  const PokemonListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends ConsumerState<PokemonListView> {
  final debouncer = Debouncer(delay: const Duration(milliseconds: 250));
  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final pokemonListPr = ref.watch(pokemonListProvider);

    ref.listen(pokemonListProvider, (previous, next) {
      logger.d('is loading ${next.isLoading}');
      logger.d('is reloading ${next.isReloading}');
    });

    scrollController.addListener(() async {
      if (!ref.watch(isLastPageProvider) &&
          !pokemonListPr.isLoading &&
          !pokemonListPr.isReloading &&
          (scrollController.offset >= scrollController.position.maxScrollExtent &&
              !scrollController.position.outOfRange)) {
        await ref.watch(pokemonListProvider.notifier).fetchNextPage();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon List'),
        actions: const [
          FavouriteBadgeWidget(),
        ],
      ),
      body: pokemonListPr.when(
        skipLoadingOnReload: true,
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('No Pokemons Fetched', style: TextStyle(fontSize: 20)),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(pokemonListProvider);
            },
            child: GridView.builder(
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
            ),
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
