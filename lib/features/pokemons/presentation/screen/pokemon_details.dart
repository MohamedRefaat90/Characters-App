import 'package:cached_network_image/cached_network_image.dart';
import 'package:characters_app/core/widgets/custom_loading_widget.dart';
import 'package:characters_app/features/pokemons/provider/pokemon_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../widgets/pokemon_type_icons.dart';

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
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(pokemon.name,
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5,
                        color: Colors.black,
                      )),
                  Text(pokemon.species,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                  const SizedBox(height: 20),
                  PokemonTypeIcons(pokemon: pokemon),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      pokemon.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              error: (error, stackTrace) => CustomErrorWidget(error.toString()),
              loading: () => const CustomLoadingWidget(),
            ),
      ),
    );
  }
}
