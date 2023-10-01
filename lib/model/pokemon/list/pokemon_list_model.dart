import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'pokemon_list_model.freezed.dart';
part 'pokemon_list_model.g.dart';

PokemonListModel pokemonListModelFromJson(String str) => PokemonListModel.fromJson(json.decode(str));

@Freezed(toJson: false, copyWith: false)
class PokemonListModel with _$PokemonListModel {
  const factory PokemonListModel({
    int? count,
    String? next,
    String? previous,
    List<Pokemon>? results,
  }) = _PokemonListModel;

  factory PokemonListModel.fromJson(Map<String, dynamic> json) => _$PokemonListModelFromJson(json);
}

@Freezed(toJson: false, copyWith: false)
class Pokemon with _$Pokemon {
  @HiveType(typeId: 0, adapterName: 'PokemonAdapter')
  const factory Pokemon({
    @HiveField(0) String? name,
    @HiveField(1) String? url,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}
