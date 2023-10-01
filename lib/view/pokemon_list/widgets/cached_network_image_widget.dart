import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_case_study/constants/asset_constants/asset_constants.dart';
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart';
import 'package:pokedex_case_study/utils/extensions/model_extension.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: pokemon.getImageUrl,
      placeholder: (context, url) => Center(
        child: Image.asset(AssetConstants.pokeball),
      ),
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Image.asset(AssetConstants.pokeball),
    );
  }
}
