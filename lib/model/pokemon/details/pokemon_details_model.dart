import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'pokemon_details_model.freezed.dart';
part 'pokemon_details_model.g.dart';

PokemonDetailsModel pokemonDetailsModelFromJson(String str) => PokemonDetailsModel.fromJson(json.decode(str));

String pokemonDetailsModelToJson(PokemonDetailsModel data) => json.encode(data.toJson());

@freezed
class PokemonDetailsModel with _$PokemonDetailsModel {
  const factory PokemonDetailsModel({
    List<Ability>? abilities,
    int? baseExperience,
    List<Species>? forms,
    List<GameIndex>? gameIndices,
    int? height,
    List<HeldItem>? heldItems,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    List<Move>? moves,
    String? name,
    int? order,
    List<dynamic>? pastTypes,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) = _PokemonDetailsModel;

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) => _$PokemonDetailsModelFromJson(json);
}

@freezed
class Ability with _$Ability {
  const factory Ability({
    Species? ability,
    bool? isHidden,
    int? slot,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}

@freezed
class Species with _$Species {
  const factory Species({
    String? name,
    String? url,
  }) = _Species;

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);
}

@freezed
class GameIndex with _$GameIndex {
  const factory GameIndex({
    int? gameIndex,
    Species? version,
  }) = _GameIndex;

  factory GameIndex.fromJson(Map<String, dynamic> json) => _$GameIndexFromJson(json);
}

@freezed
class HeldItem with _$HeldItem {
  const factory HeldItem({
    Species? item,
    List<VersionDetail>? versionDetails,
  }) = _HeldItem;

  factory HeldItem.fromJson(Map<String, dynamic> json) => _$HeldItemFromJson(json);
}

@freezed
class VersionDetail with _$VersionDetail {
  const factory VersionDetail({
    int? rarity,
    Species? version,
  }) = _VersionDetail;

  factory VersionDetail.fromJson(Map<String, dynamic> json) => _$VersionDetailFromJson(json);
}

@freezed
class Move with _$Move {
  const factory Move({
    Species? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) = _Move;

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
}

@freezed
class VersionGroupDetail with _$VersionGroupDetail {
  const factory VersionGroupDetail({
    int? levelLearnedAt,
    Species? moveLearnMethod,
    Species? versionGroup,
  }) = _VersionGroupDetail;

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => _$VersionGroupDetailFromJson(json);
}

@freezed
class GenerationV with _$GenerationV {
  const factory GenerationV({
    Sprites? blackWhite,
  }) = _GenerationV;

  factory GenerationV.fromJson(Map<String, dynamic> json) => _$GenerationVFromJson(json);
}

@freezed
class GenerationIv with _$GenerationIv {
  const factory GenerationIv({
    Sprites? diamondPearl,
    Sprites? heartgoldSoulsilver,
    Sprites? platinum,
  }) = _GenerationIv;

  factory GenerationIv.fromJson(Map<String, dynamic> json) => _$GenerationIvFromJson(json);
}

@freezed
class Versions with _$Versions {
  const factory Versions({
    GenerationI? generationI,
    GenerationIi? generationIi,
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationV? generationV,
    Map<String, Home>? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) = _Versions;

  factory Versions.fromJson(Map<String, dynamic> json) => _$VersionsFromJson(json);
}

@freezed
class Sprites with _$Sprites {
  const factory Sprites({
    String? backDefault,
    String? backFemale,
    String? backShiny,
    String? backShinyFemale,
    String? frontDefault,
    String? frontFemale,
    String? frontShiny,
    String? frontShinyFemale,
    Other? other,
    Versions? versions,
    Sprites? animated,
  }) = _Sprites;

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
}

@freezed
class GenerationI with _$GenerationI {
  const factory GenerationI({
    RedBlue? redBlue,
    RedBlue? yellow,
  }) = _GenerationI;

  factory GenerationI.fromJson(Map<String, dynamic> json) => _$GenerationIFromJson(json);
}

@freezed
class RedBlue with _$RedBlue {
  const factory RedBlue({
    String? backDefault,
    String? backGray,
    String? backTransparent,
    String? frontDefault,
    String? frontGray,
    String? frontTransparent,
  }) = _RedBlue;

  factory RedBlue.fromJson(Map<String, dynamic> json) => _$RedBlueFromJson(json);
}

@freezed
class GenerationIi with _$GenerationIi {
  const factory GenerationIi({
    Crystal? crystal,
    Gold? gold,
    Gold? silver,
  }) = _GenerationIi;

  factory GenerationIi.fromJson(Map<String, dynamic> json) => _$GenerationIiFromJson(json);
}

@freezed
class Crystal with _$Crystal {
  const factory Crystal({
    String? backDefault,
    String? backShiny,
    String? backShinyTransparent,
    String? backTransparent,
    String? frontDefault,
    String? frontShiny,
    String? frontShinyTransparent,
    String? frontTransparent,
  }) = _Crystal;

  factory Crystal.fromJson(Map<String, dynamic> json) => _$CrystalFromJson(json);
}

@freezed
class Gold with _$Gold {
  const factory Gold({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
    String? frontTransparent,
  }) = _Gold;

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);
}

@freezed
class GenerationIii with _$GenerationIii {
  const factory GenerationIii({
    OfficialArtwork? emerald,
    Gold? fireredLeafgreen,
    Gold? rubySapphire,
  }) = _GenerationIii;

  factory GenerationIii.fromJson(Map<String, dynamic> json) => _$GenerationIiiFromJson(json);
}

@freezed
class OfficialArtwork with _$OfficialArtwork {
  const factory OfficialArtwork({
    String? frontDefault,
    String? frontShiny,
  }) = _OfficialArtwork;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => _$OfficialArtworkFromJson(json);
}

@freezed
class Home with _$Home {
  const factory Home({
    String? frontDefault,
    String? frontFemale,
    String? frontShiny,
    String? frontShinyFemale,
  }) = _Home;

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);
}

@freezed
class GenerationVii with _$GenerationVii {
  const factory GenerationVii({
    DreamWorld? icons,
    Home? ultraSunUltraMoon,
  }) = _GenerationVii;

  factory GenerationVii.fromJson(Map<String, dynamic> json) => _$GenerationViiFromJson(json);
}

@freezed
class DreamWorld with _$DreamWorld {
  const factory DreamWorld({
    String? frontDefault,
    String? frontFemale,
  }) = _DreamWorld;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => _$DreamWorldFromJson(json);
}

@freezed
class GenerationViii with _$GenerationViii {
  const factory GenerationViii({
    DreamWorld? icons,
  }) = _GenerationViii;

  factory GenerationViii.fromJson(Map<String, dynamic> json) => _$GenerationViiiFromJson(json);
}

@freezed
class Other with _$Other {
  const factory Other({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
  }) = _Other;

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);
}

@freezed
class Stat with _$Stat {
  const factory Stat({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'base_stat')
    int? baseStat,
    int? effort,
    Species? stat,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}

@freezed
class Type with _$Type {
  const factory Type({
    int? slot,
    Species? type,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}
