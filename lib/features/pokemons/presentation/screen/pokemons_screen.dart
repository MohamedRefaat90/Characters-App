import 'package:characters_app/core/widgets/custom_error_widget.dart';
import 'package:characters_app/core/widgets/custom_loading_widget.dart';
import 'package:characters_app/features/pokemons/data/models/pokemon_model.dart';
import 'package:characters_app/features/pokemons/presentation/widgets/pokemon_card.dart';
import 'package:characters_app/features/pokemons/provider/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonsScreen extends ConsumerStatefulWidget {
  const PokemonsScreen({super.key});

  @override
  ConsumerState<PokemonsScreen> createState() => _PokemonsScreenState();
}

class _PokemonsScreenState extends ConsumerState<PokemonsScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final pokemonState = ref.watch(pokemonProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Pokemons')),
        body: pokemonState.isLoading && pokemonState.pokemons.isEmpty
            ? const Center(
                child: CustomLoadingWidget(
                    lottie:
                        "assets/lottie/pokemon_image_loader.json")) // Show loading widget when initially loading
            : pokemonState.errorMessage != null
                ? CustomErrorWidget(
                    pokemonState.errorMessage!) // Show error if exists
                : Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                            controller: _scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: pokemonState.pokemons.length,
                            itemBuilder: (context, index) {
                              final pokemonModel = PokemonModel.fromMap(
                                  pokemonState.pokemons[index]);
                              return PokemonCard(pokemon: pokemonModel);
                            }),
                      ),
                      if (pokemonState.isLoading)
                        const Center(child: CircularProgressIndicator()),
                    ],
                  ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    // Load more when the user scrolls near the bottom
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(pokemonProvider.notifier).getAllPokemons();
    }
  }
}
