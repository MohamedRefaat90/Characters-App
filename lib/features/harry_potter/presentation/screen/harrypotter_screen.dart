import 'package:characters_app/core/constants/app_colors.dart';
import 'package:characters_app/core/widgets/custom_error_widget.dart';
import 'package:characters_app/core/widgets/loading_widget.dart';
import 'package:characters_app/features/harry_potter/data/models/harrypotter_model.dart';
import 'package:characters_app/features/harry_potter/presentation/widgets/hp_character_card.dart';
import 'package:characters_app/features/harry_potter/provider/hp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HarrypotterScreen extends ConsumerStatefulWidget {
  const HarrypotterScreen({super.key});

  @override
  ConsumerState<HarrypotterScreen> createState() => _HarrypotterScreenState();
}

class _HarrypotterScreenState extends ConsumerState<HarrypotterScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(hpProvider);
    return Scaffold(
        appBar: AppBar(title: const Text("Harry Potter Characters")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ref.watch(hpProvider).when(
              data: (data) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    HarrypotterModel hpCharacter =
                        HarrypotterModel.fromMap(data[index]);
                    return HpCharacterCard(hpCharacter: hpCharacter);
                  },
                );
              },
              error: (error, stackTrace) => CustomErrorWidget(error.toString()),
              loading: () => const CustomLoadingWidget()),
        ));
  }
}
