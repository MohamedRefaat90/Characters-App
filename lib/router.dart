import 'package:characters_app/core/constants/app_routings.dart';
import 'package:characters_app/features/home/presentation/screen/home_screen.dart';
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
      path: AppRouting.harrypotter,
      name: AppRouting.harrypotter,
      builder: (context, state) => const PokemonsScreen()),
]);
