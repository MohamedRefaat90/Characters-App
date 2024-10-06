import 'package:characters_app/features/harry_potter/data/repo/hp_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hpProvider = FutureProvider.autoDispose((ref) async {
  return await ref.watch(hpRepo).getAllCharacters();
});
