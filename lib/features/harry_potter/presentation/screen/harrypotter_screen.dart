import 'package:flutter/material.dart';

class HarrypotterScreen extends StatelessWidget {
  const HarrypotterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => const Card(),
      ),
    );
  }
}
