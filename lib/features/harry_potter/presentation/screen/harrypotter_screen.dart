import 'package:audioplayers/audioplayers.dart';
import 'package:characters_app/core/constants/app_colors.dart';
import 'package:characters_app/core/widgets/custom_error_widget.dart';
import 'package:characters_app/features/harry_potter/data/models/harrypotter_model.dart';
import 'package:characters_app/features/harry_potter/presentation/widgets/hp_character_card.dart';
import 'package:characters_app/features/harry_potter/presentation/widgets/skeletonizer_loader.dart';
import 'package:characters_app/features/harry_potter/provider/hp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HarrypotterScreen extends ConsumerStatefulWidget {
  const HarrypotterScreen({super.key});

  @override
  ConsumerState<HarrypotterScreen> createState() => _HarrypotterScreenState();
}

class _HarrypotterScreenState extends ConsumerState<HarrypotterScreen> {
  final player = AudioPlayer();

  playSound() async {
    await player.play(AssetSource('audios/HarryPotter.mp3'), volume: 100);
  }

  @override
  void initState() {
    super.initState();
    playSound();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(hpProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff000000),
          leading: const BackButton(color: AppColors.white),
          title: const Text(
            "Harry Potter Characters",
            style: TextStyle(
                fontFamily: 'HarryP_font',
                letterSpacing: 1.5,
                fontSize: 30,
                color: AppColors.white),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/bg.jpeg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ref.watch(hpProvider).when(
                  data: (data) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.90,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        HarrypotterModel hpCharacter =
                            HarrypotterModel.fromMap(data[index]);
                        return HpCharacterCard(hpCharacter: hpCharacter);
                      },
                    );
                  },
                  error: (error, stackTrace) =>
                      CustomErrorWidget(error.toString()),
                  loading: () => const SkeletonizerLoader()),
            ),
          ],
        ));
  }
}
