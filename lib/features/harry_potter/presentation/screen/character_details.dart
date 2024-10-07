import 'package:cached_network_image/cached_network_image.dart';
import 'package:characters_app/core/helpers/get_house_image.dart';
import 'package:characters_app/core/widgets/custom_error_widget.dart';
import 'package:characters_app/core/widgets/custom_loading_widget.dart';
import 'package:characters_app/features/harry_potter/presentation/widgets/hp_badge.dart';
import 'package:characters_app/features/harry_potter/provider/hp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helpers/get_patronus_image.dart';

class CharacterDetails extends ConsumerWidget {
  final int characterId;
  const CharacterDetails({super.key, required this.characterId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ref.watch(characterProvider(characterId)).when(
              data: (character) => Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: character.image,
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Text(character.name,
                      style: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'HarryP_font')),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(),
                      HpBadge(
                        badge: getHouseImage(character.house!),
                        title: character.house!,
                      ),
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          Text(
                            character.yearOfBirth!,
                            style: const TextStyle(fontSize: 30),
                          ),
                          const Text('Year of Birth',
                              style: TextStyle(fontSize: 15)),
                        ],
                      ),
                      const SizedBox(width: 30),
                      HpBadge(
                        badge: getPatronusImage(character.patronus!),
                        title: "Patronus",
                      )
                    ],
                  )
                ],
              ),
              error: (error, stackTrace) => CustomErrorWidget(error.toString()),
              loading: () => const CustomLoadingWidget(
                  lottie: "assets/lottie/harrypotterLoader.json"),
            ),
      ),
    );
  }
}
