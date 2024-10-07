import 'package:characters_app/core/constants/app_assets.dart';
import 'package:characters_app/core/constants/app_routings.dart';
import 'package:characters_app/features/home/data/models/category_model.dart';
import 'package:characters_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, bool>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<bool> {
  HomeNotifier() : super(false);

  List<CategoryModel> categories = [
    CategoryModel(
      name: 'Harry Potter',
      image: AppAssets.hpLogo,
      color: Colors.black87,
      press: () => router.pushNamed(AppRouting.harrypotter),
    ),
    CategoryModel(
        name: 'Pokemon',
        image: AppAssets.pokemonLogo,
        color: Colors.amber,
        press: () => router.pushNamed(AppRouting.pokemons)),
  ];
}
