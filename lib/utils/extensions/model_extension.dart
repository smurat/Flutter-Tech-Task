import 'package:pokedex_case_study/model/pokemon/details/pokemon_details_model.dart';
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart';

extension PokemonExtension on Pokemon {
  String get id {
    final data = url?.split('/');
    data?.removeLast();
    return data?.last ?? '1';
  }

  String get getImageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}

extension StringExtension on String {
  String get capitalizeFirst => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
  String get capitalize => trim().split(' ').map((e) => e.capitalizeFirst).join(' ');
}

extension PokemonStatExtension on Species {
  String? get subName {
    if ((name?.length ?? 0) <= 3) return name;
    return name?.substring(0, 3);
  }
}
