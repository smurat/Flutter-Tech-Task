import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart';
import 'package:pokedex_case_study/utils/extensions/model_extension.dart';
import 'package:pokedex_case_study/view/pokemon_details/widgets/details_view_page.dart';
import 'package:pokedex_case_study/view/pokemon_details/widgets/get_image_color.dart';
import 'package:pokedex_case_study/view/pokemon_details/widgets/details_sliver_app_bar.dart';
import 'package:pokedex_case_study/view/pokemon_details/widgets/details_title.dart';
import 'package:pokedex_case_study/viewmodel/pokemon_feature/providers/pokemon_providers.dart';

@RoutePage()
class PokemonDetailsView extends ConsumerStatefulWidget {
  const PokemonDetailsView({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonDetailsRouteState();
}

class _PokemonDetailsRouteState extends ConsumerState<PokemonDetailsView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final pixel = _scrollController.position.pixels;

    if (pixel > (300 - 60)) {
      ref.read(detailTitleOpacityProvider.notifier).update((state) => state = true);
    } else {
      ref.read(detailTitleOpacityProvider.notifier).update((state) => state = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageColor = ref.watch(imageColorProvider(widget.pokemon.getImageUrl)).value;
    final details = ref.watch(
      pokemonDetailProvider(widget.pokemon.url ?? ''),
    );

    final mainColor = imageColor?.dominantColor?.color ?? const Color(0xFFB8DFCA);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          DetailsSliverAppbar(
            imageColor: imageColor,
            pokemon: widget.pokemon,
            scrollController: _scrollController,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          DetailsTitle(pokemon: widget.pokemon),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          details.when(
            data: (data) {
              return DetailsPageView(
                data: data,
                backgroundColor: imageColor?.paletteColors.last.color,
                progressBarColor: mainColor,
              );
            },
            error: (error, _) => SliverToBoxAdapter(
              child: Text(
                error.toString(),
              ),
            ),
            loading: () => const SliverToBoxAdapter(
                child: Center(
              child: SizedBox.square(
                dimension: 30,
                child: CircularProgressIndicator.adaptive(),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
