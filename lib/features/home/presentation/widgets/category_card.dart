import 'package:characters_app/core/constants/app_colors.dart';
import 'package:characters_app/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
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
              style: TextStyle(
                  fontWeight: category.name == "Harry Potter"
                      ? FontWeight.normal
                      : FontWeight.bold,
                  letterSpacing: category.name == "Harry Potter" ? 2 : 0,
                  color: AppColors.white,
                  fontSize: category.name == "Harry Potter" ? 25 : 17,
                  fontFamily:
                      category.name == "Harry Potter" ? 'HarryP_font' : ''),
            ),
          ],
        ),
      ),
    );
  }
}
