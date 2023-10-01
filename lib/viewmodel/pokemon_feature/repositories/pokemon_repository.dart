import 'package:dio/dio.dart';
import 'package:pokedex_case_study/constants/api/api_constants.dart';
import 'package:pokedex_case_study/core/network_manager/dio_provider.dart';
import 'package:pokedex_case_study/model/pokemon/details/pokemon_details_model.dart';
import 'package:pokedex_case_study/model/pokemon/list/pokemon_list_model.dart';
import 'package:pokedex_case_study/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_repository.g.dart';

@riverpod
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) {
  return PokemonRepository(
    dio: ref.watch(dioProvider),
  );
}

class PokemonRepository {
  PokemonRepository({required this.dio});
  final Dio dio;

  Future<List<Pokemon>> fetchPokemonsPagination({required int offset, int limit = 20, CancelToken? cancelToken}) async {
    try {
      final response = await dio.get(
        '${ApiConstants.baseUrl}/${ApiConstants.pokemonPath}',
        cancelToken: cancelToken,
        queryParameters: {
          'offset': offset,
          'limit': limit,
        },
        options: Options(responseType: ResponseType.plain),
      );
      final pokemonListModel = pokemonListModelFromJson(response.data);
      return pokemonListModel.results ?? [];
    } catch (e, s) {
      logger.e("Error", error: e, stackTrace: s);
      return Future.error(e, s);
    }
  }

  Future<PokemonDetailsModel> fetchPokemon(String detailUrl, {CancelToken? cancelToken}) async {
    try {
      final response = await dio.get(
        detailUrl,
        cancelToken: cancelToken,
        options: Options(responseType: ResponseType.plain),
      );
      final pokemonModel = pokemonDetailsModelFromJson(response.data);
      return pokemonModel;
    } catch (e, s) {
      logger.e("Error", error: e, stackTrace: s);
      return Future.error(e, s);
    }
  }
}
