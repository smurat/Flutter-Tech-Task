// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonAdapter extends TypeAdapter<_$PokemonImpl> {
  @override
  final int typeId = 0;

  @override
  // ignore: library_private_types_in_public_api
  _$PokemonImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PokemonImpl(
      name: fields[0] as String?,
      url: fields[1] as String?,
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  void write(BinaryWriter writer, _$PokemonImpl obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonListModelImpl _$$PokemonListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PokemonListModelImpl(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
