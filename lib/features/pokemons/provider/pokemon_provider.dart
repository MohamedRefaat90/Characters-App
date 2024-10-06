import 'package:characters_app/features/pokemons/data/repo/pokemons_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonPaginationState {
  final List pokemons;
  final bool isLoading;
  final bool hasMore;
  final int totalNum;
  final String? errorMessage;

  PokemonPaginationState({
    required this.pokemons,
    required this.isLoading,
    required this.hasMore,
    required this.totalNum,
    this.errorMessage,
  });

  // Create a copyWith method to easily update the state
  PokemonPaginationState copyWith(
      {List? pokemons,
      bool? isLoading,
      bool? hasMore,
      String? errorMessage,
      int? totalNum}) {
    return PokemonPaginationState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      errorMessage: errorMessage ?? this.errorMessage,
      totalNum: totalNum ?? this.totalNum,
    );
  }
}

final pokemonProvider =
    StateNotifierProvider.autoDispose<PokemonNotifier, PokemonPaginationState>(
        (ref) {
  return PokemonNotifier(ref.watch(pokemonsRepo));
});

class PokemonNotifier extends StateNotifier<PokemonPaginationState> {
  final PokemonsRepo _pokemonsRepo;
  int _page = 1;

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

      final data = await _pokemonsRepo.getAllPokemons(page: _page);
      final newPokemons = data['results'];

      // If no more pokemons, set hasMore to false
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
