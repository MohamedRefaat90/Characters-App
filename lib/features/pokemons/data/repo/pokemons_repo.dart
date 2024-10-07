import 'package:characters_app/core/network/api_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonsRepo = Provider<PokemonsRepo>((ref) {
  return PokemonsRepo(ref.watch(apiProvider));
});

class PokemonsRepo {
  final ApiHandler _apiHandler;

  PokemonsRepo(this._apiHandler);

  Future getAllPokemons({int page = 1, int numOfItems = 10}) async {
    Response response =
        await _apiHandler.get("Pokemons?page=$page&num_of_items=$numOfItems");

    return response.data;
  }

  Future getPokemonsDetails(int pokemonID) async {
    Response response = await _apiHandler.get("Pokemons/$pokemonID");

    return response.data;
  }
}
