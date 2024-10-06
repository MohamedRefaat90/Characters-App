import 'package:characters_app/core/network/api_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonsRepo = Provider<PokemonsRepo>((ref) {
  return PokemonsRepo(ref.watch(apiProvider));
});

class PokemonsRepo {
  final ApiHandler _apiHandler;

  PokemonsRepo(this._apiHandler);

  Future<List> getAllPokemons() async {
    Response response = await _apiHandler.get("Pokemons");

    return response.data;
  }
}
