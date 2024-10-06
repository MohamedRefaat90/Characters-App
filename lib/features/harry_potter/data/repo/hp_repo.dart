import 'package:characters_app/core/network/api_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hpRepo = Provider<HpRepo>((ref) {
  return HpRepo(ref.read(apiProvider));
});

class HpRepo {
  final ApiHandler _apiHandler;

  HpRepo(this._apiHandler);

  Future<List> getAllCharacters() async {
    Response response = await _apiHandler.get("HarryPotter/");
    return response.data;
  }
}
