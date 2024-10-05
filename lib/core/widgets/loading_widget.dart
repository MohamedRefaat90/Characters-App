import 'package:characters_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 70,
        height: 70,
        child: CircularProgressIndicator(
          // color: AppColors.primaryColor,
          strokeWidth: 5,
        ),
      ),
    );
  }
}
