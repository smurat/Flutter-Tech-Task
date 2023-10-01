import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart';
import 'package:pokedex_case_study/utils/extensions/model_extension.dart';
import 'package:pokedex_case_study/view/pokemon_details/widgets/pokedex_silver_app_bar.dart';
import 'package:pokedex_case_study/view/pokemon_list/widgets/cached_network_image_widget.dart';
import 'package:pokedex_case_study/viewmodel/pokemon_feature/providers/pokemon_providers.dart';

class DetailsSliverAppbar extends ConsumerWidget {
  const DetailsSliverAppbar({
    super.key,
    this.imageColor,
    required this.scrollController,
    required this.pokemon,
  });

  final PaletteGenerator? imageColor;
  final ScrollController scrollController;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleOpacity = ref.watch(detailTitleOpacityProvider);
    return PokedexSilverAppBar(
      titleOpacity: titleOpacity,
      backgroundColor: imageColor?.dominantColor?.color ?? const Color(0xFFB8DFCA),
      scrollController: scrollController,
      collapsedHeight: 60,
      title: Text(
        pokemon.name!.toUpperCase(),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background:
            Hero(tag: ValueKey('__pokemon_image_${pokemon.id}__'), child: CachedNetworkImageWidget(pokemon: pokemon)),
      ),
    );
  }
}
