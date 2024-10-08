import 'package:cached_network_image/cached_network_image.dart';
import 'package:characters_app/core/constants/app_assets.dart';
import 'package:characters_app/core/constants/app_colors.dart';
import 'package:characters_app/core/constants/app_routings.dart';
import 'package:characters_app/core/widgets/custom_loading_widget.dart';
import 'package:characters_app/features/pokemons/data/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCard({super.key, required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.pushNamed(AppRouting.pokemonsDetails, extra: pokemon.id),
      child: Card(
        elevation: 7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.id,
                child: CachedNetworkImage(
                  imageUrl: pokemon.image,
                  height: 150,
                  placeholder: (context, url) => const CustomLoadingWidget(
                      lottie: AppAssets.pokemonLoader, size: 70),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
              child: Center(
                child: Text(
                  pokemon.name,
                  style: GoogleFonts.abel(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
