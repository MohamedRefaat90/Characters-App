import 'package:characters_app/core/widgets/custom_error_widget.dart';
import 'package:characters_app/core/widgets/loading_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pokemons')),
        body: ref.watch(pokemonProvider).when(
              data: (data) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  PokemonModel pokemonModel = PokemonModel.fromMap(data[index]);
                  return PokemonCard(pokemon: pokemonModel);
                },
              ),
              error: (error, stackTrace) => CustomErrorWidget(error.toString()),
              loading: () => const CustomLoadingWidget(),
            ));
  }

  @override
  void initState() {
    ref.read(pokemonProvider);
    super.initState();
  }
}
