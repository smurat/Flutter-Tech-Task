import 'package:flutter/material.dart';
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart';
import 'package:pokedex_case_study/utils/extensions/model_extension.dart';

class DetailsTitle extends StatelessWidget {
  const DetailsTitle({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Hero(
            tag: ValueKey('__pokemon_title_${pokemon.id}__'),
            child: Text(
              pokemon.name!.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Hero(
            tag: ValueKey('__pokemon_id_${pokemon.id}__'),
            child: Text(
              '#${pokemon.id}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
