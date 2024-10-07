import 'package:characters_app/features/harry_potter/data/models/harrypotter_model.dart';
import 'package:characters_app/features/harry_potter/presentation/widgets/hp_character_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerLoader extends StatelessWidget {
  const SkeletonizerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final fakeUsers = List.filled(
      7,
      HarrypotterModel(name: 'User name', id: 0, image: ''),
    );

    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.90,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: fakeUsers.length,
        itemBuilder: (context, index) {
          return HpCharacterCard(hpCharacter: fakeUsers[index]);
        },
      ),
    );
  }
}
