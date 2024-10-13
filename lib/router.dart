import 'package:characters_app/core/constants/app_routings.dart';
import 'package:characters_app/core/services/secure_storage.dart';
import 'package:characters_app/features/auth/presentation/screen/auth_screen.dart';
import 'package:characters_app/features/harry_potter/presentation/screen/character_details.dart';
import 'package:characters_app/features/harry_potter/presentation/screen/harrypotter_screen.dart';
import 'package:characters_app/features/home/presentation/screen/home_screen.dart';
import 'package:characters_app/features/pokemons/presentation/screen/pokemon_details.dart';
import 'package:go_router/go_router.dart';

import 'features/pokemons/presentation/screen/pokemons_screen.dart';

GoRouter router = GoRouter(
    initialLocation: AppRouting.auth,
    redirect: (context, state) => setDefualtRoute(state),
    routes: [
      GoRoute(
          path: AppRouting.auth,
          name: AppRouting.auth,
          builder: (context, state) => const AuthScreen()),
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

Future<String?> setDefualtRoute(GoRouterState state) async {
  final token = await SecureStorage.read('token');

  // If the user is not authenticated and is trying to access a protected route
  final isAuthenticated = token != null && token.trim().isNotEmpty;
  final isAuthRoute = state.matchedLocation == AppRouting.auth;

  if (!isAuthenticated && !isAuthRoute) {
    // Redirect to auth screen if not authenticated
    return AppRouting.auth;
  }

  if (isAuthenticated && isAuthRoute) {
    // If authenticated and on the auth screen, redirect to home
    return AppRouting.home;
  }

  // No redirection if the user is navigating to other routes
  return null;
}
