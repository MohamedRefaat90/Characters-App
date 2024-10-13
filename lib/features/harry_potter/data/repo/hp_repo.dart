import 'package:characters_app/core/network/api_endpoints.dart';
import 'package:characters_app/core/network/api_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hpRepo = Provider.autoDispose<HpRepo>((ref) {
  return HpRepo(ref.read(apiHandlerProvider));
});

class HpRepo {
  final ApiHandler _apiHandler;

  HpRepo(this._apiHandler);

  Future<List> getAllCharacters({int numOfItems = 30}) async {
    var response = await _apiHandler
        .get("${ApiEndpoints.harrypotter}?page=1&num_of_items=$numOfItems");
    return response.data['results'];
  }

  getCharacterDetails(int characterId) async {
    Response response = await _apiHandler.get("HarryPotter/$characterId");
    return response.data;
  }
}
