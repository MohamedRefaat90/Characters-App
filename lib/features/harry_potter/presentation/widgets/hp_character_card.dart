import 'package:cached_network_image/cached_network_image.dart';
import 'package:characters_app/features/harry_potter/data/models/harrypotter_model.dart';
import 'package:flutter/material.dart';

class HpCharacterCard extends StatelessWidget {
  final HarrypotterModel hpCharacter;

  const HpCharacterCard({
    super.key,
    required this.hpCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        CachedNetworkImage(
          imageUrl: hpCharacter.image,
          height: 170,
        ),
        const SizedBox(height: 10),
        Text(
          hpCharacter.name,
          style: const TextStyle(fontWeight: FontWeight.w500),
        )
      ]),
    );
  }
}
