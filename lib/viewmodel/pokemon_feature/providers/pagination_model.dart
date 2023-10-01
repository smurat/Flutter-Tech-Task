import 'package:equatable/equatable.dart';

class PokemonPagination extends Equatable {
  const PokemonPagination({required this.offset, required this.limit});
  final int offset;
  final int limit;

  @override
  List<Object> get props => [offset, limit];

  PokemonPagination copyWith({
    int? offset,
    int? limit,
  }) {
    return PokemonPagination(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
    );
  }
}
