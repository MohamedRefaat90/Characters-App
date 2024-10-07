import 'package:characters_app/core/constants/app_routings.dart';
import 'package:characters_app/features/harry_potter/presentation/screen/character_details.dart';
import 'package:characters_app/features/harry_potter/presentation/screen/harrypotter_screen.dart';
import 'package:characters_app/features/home/presentation/screen/home_screen.dart';
import 'package:characters_app/features/pokemons/presentation/screen/pokemon_details.dart';
import 'package:go_router/go_router.dart';

import 'features/pokemons/presentation/screen/pokemons_screen.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
      path: AppRouting.home,
      name: AppRouting.home,
      builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: AppRouting.pokemons,
      name: AppRouting.pokemons,
      builder: (context, state) => const PokemonsScreen()),
  GoRoute(
      path: AppRouting.pokemonsDetails,
      name: AppRouting.pokemonsDetails,
      builder: (context, state) =>
          PokemonDetails(pokemonId: state.extra as int)),
  GoRoute(
      path: AppRouting.harrypotter,
      name: AppRouting.harrypotter,
      builder: (context, state) => const HarrypotterScreen()),
  GoRoute(
      path: AppRouting.characterDetails,
      name: AppRouting.characterDetails,
      builder: (context, state) =>
          CharacterDetails(characterId: state.extra as int)),
]);
