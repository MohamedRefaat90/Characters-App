import 'package:cached_network_image/cached_network_image.dart';
import 'package:characters_app/core/constants/app_routings.dart';
import 'package:characters_app/features/harry_potter/data/models/harrypotter_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HpCharacterCard extends StatelessWidget {
  final HarrypotterModel hpCharacter;

  const HpCharacterCard({super.key, required this.hpCharacter});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.pushNamed(AppRouting.characterDetails, extra: hpCharacter.id),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(children: [
          CachedNetworkImage(
            imageUrl: hpCharacter.image,
            errorWidget: (context, url, error) => const SizedBox(
                width: 20,
                height: 20,
                child: Center(child: CircularProgressIndicator())),
            height: 170,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            alignment: const Alignment(0, -0.7),
          ),
          const SizedBox(height: 10),
          Text(
            hpCharacter.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}
