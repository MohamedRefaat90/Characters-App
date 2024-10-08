import 'package:characters_app/core/helpers/get_pokemon_type_image.dart';
import 'package:characters_app/features/pokemons/data/models/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonTypeIcons extends StatelessWidget {
  const PokemonTypeIcons({super.key, required this.pokemon});
  final PokemonModel pokemon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: pokemon.type.length,
          itemBuilder: (context, index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(getPokemonTypeImage(pokemon.type[index]),
                  width: 70, height: 70),
              Text(pokemon.type[index])
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 15),
        ),
      ),
    );
  }
}
