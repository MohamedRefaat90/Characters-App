import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:characters_app/features/home/presentation/widgets/category_card.dart';
import 'package:characters_app/features/home/provider/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeNotifier = ref.watch(homeProvider.notifier);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welecom To Characters App",
            style: GoogleFonts.cairoPlay(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: homeNotifier.categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                CategoryCard(category: homeNotifier.categories[index]),
          )
        ],
      ),
    );
  }
}
