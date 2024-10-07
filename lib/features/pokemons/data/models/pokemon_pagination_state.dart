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
