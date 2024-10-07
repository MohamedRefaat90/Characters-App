import 'package:flutter/material.dart';

class HpBadge extends StatelessWidget {
  final String badge;
  final String title;
  const HpBadge({
    super.key,
    required this.badge,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          badge,
          height: 80,
          errorBuilder: (context, error, stackTrace) => const SizedBox(
              height: 80,
              child: Center(
                  child: Icon(
                Icons.warning_amber_rounded,
                size: 50,
                color: Colors.amber,
              ))),
        ),
        Text(title, style: const TextStyle(fontSize: 22)),
      ],
    );
  }
}
