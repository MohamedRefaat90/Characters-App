import 'package:characters_app/core/constants/app_assets.dart';
import 'package:characters_app/features/home/data/models/category_model.dart';
import 'package:characters_app/features/home/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
          name: 'Harry Potter', image: AppAssets.hp, color: Colors.black87),
      CategoryModel(
          name: 'Pokemon', image: AppAssets.pokemon, color: Colors.amber),
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                CategoryCard(category: categories[index]),
          )
        ],
      ),
    );
  }
}
