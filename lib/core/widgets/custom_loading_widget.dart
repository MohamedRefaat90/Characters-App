import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingWidget extends StatelessWidget {
  final String? lottie;
  final double size;
  const CustomLoadingWidget({super.key, this.lottie, this.size = 150});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: lottie == null
            ? const CircularProgressIndicator(
                strokeWidth: 5,
              )
            : Lottie.asset(lottie!, height: size),
      ),
    );
  }
}
