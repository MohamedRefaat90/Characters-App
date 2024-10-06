import 'package:characters_app/features/pokemons/data/repo/pokemons_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonProvider = FutureProvider.autoDispose<List>((ref) async {
  return await ref.watch(pokemonsRepo).getAllPokemons();
});
