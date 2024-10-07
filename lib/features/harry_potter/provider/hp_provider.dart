import 'package:characters_app/features/harry_potter/data/models/harrypotter_model.dart';
import 'package:characters_app/features/harry_potter/data/repo/hp_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hpProvider = FutureProvider.autoDispose((ref) async {
  return await ref.watch(hpRepo).getAllCharacters(numOfItems: 30);
});

final characterProvider =
    FutureProvider.autoDispose.family<HarrypotterModel, int>((ref, id) async {
  return HarrypotterModel.fromMap(
      await ref.watch(hpRepo).getCharacterDetails(id));
});
