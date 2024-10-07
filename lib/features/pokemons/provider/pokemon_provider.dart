import 'package:characters_app/features/pokemons/data/models/pokemon_pagination_state.dart';
import 'package:characters_app/features/pokemons/data/repo/pokemons_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonProvider =
    StateNotifierProvider.autoDispose<PokemonNotifier, PokemonPaginationState>(
        (ref) {
  return PokemonNotifier(ref.watch(pokemonsRepo));
});

class PokemonNotifier extends StateNotifier<PokemonPaginationState> {
  final PokemonsRepo _pokemonsRepo;
  int _page = 1;
  int numOfItems = 10;

  PokemonNotifier(this._pokemonsRepo)
      : super(PokemonPaginationState(
            pokemons: [], hasMore: true, isLoading: false, totalNum: 0)) {
    getAllPokemons();
  }

  Future<void> getAllPokemons() async {
    if (!state.hasMore || state.isLoading) return;

    try {
      // Set loading state to true
      state = state.copyWith(isLoading: true, errorMessage: null);

      final data = await _pokemonsRepo.getAllPokemons(
        page: _page,
        numOfItems: numOfItems,
      );
      final newPokemons = data['results'];

      // Update the state with new data to trigger a rebuild
      state = state.copyWith(
          pokemons: [...state.pokemons, ...newPokemons],
          hasMore: newPokemons.isNotEmpty,
          isLoading: false,
          totalNum: data['count']);

      _page++; // Move to the next page
    } catch (error) {
      // Handle errors and set error message
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }
}
