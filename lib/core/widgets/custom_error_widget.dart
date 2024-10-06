import 'package:characters_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.error, {super.key});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
        child: Text(
          error,
          style: const TextStyle(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
