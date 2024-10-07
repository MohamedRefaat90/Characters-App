import 'package:characters_app/features/pokemons/data/models/pokemon_model.dart';
import 'package:characters_app/features/pokemons/data/repo/pokemons_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonDetailsProvider =
    FutureProvider.autoDispose.family<PokemonModel, int>((ref, id) async {
  return PokemonModel.fromMap(
      await ref.read(pokemonsRepo).getPokemonsDetails(id));
});
