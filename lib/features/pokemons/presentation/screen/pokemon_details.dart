import 'package:cached_network_image/cached_network_image.dart';
import 'package:characters_app/core/widgets/custom_loading_widget.dart';
import 'package:characters_app/features/pokemons/provider/pokemon_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/custom_error_widget.dart';

class PokemonDetails extends ConsumerWidget {
  final int pokemonId;
  const PokemonDetails({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ref.watch(pokemonDetailsProvider(pokemonId)).when(
              data: (pokemon) => Column(
                children: [
                  Hero(
                    tag: pokemon.id,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.image,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(pokemon.name,
                      style: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'HarryP_font')),
                ],
              ),
              error: (error, stackTrace) => CustomErrorWidget(error.toString()),
              loading: () => const CustomLoadingWidget(),
            ),
      ),
    );
  }
}
