import 'package:characters_app/core/constants/app_colors.dart';
import 'package:characters_app/core/constants/app_routings.dart';
import 'package:characters_app/core/widgets/custom_back_button.dart';
import 'package:characters_app/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: category.press,
      child: Card(
        elevation: 20,
        color: category.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(category.image, height: 150),
            Text(
              category.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
