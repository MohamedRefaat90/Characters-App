import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingWidget extends StatelessWidget {
  final String? lottie;

  const CustomLoadingWidget({super.key, this.lottie});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: lottie == null
            ? const CircularProgressIndicator(
                // color: AppColors.primaryColor,
                strokeWidth: 5,
              )
            : Lottie.asset(lottie!, width: 70),
      ),
    );
  }
}
