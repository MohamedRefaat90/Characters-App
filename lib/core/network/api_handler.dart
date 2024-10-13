import 'dart:async';

import 'package:characters_app/core/network/dio_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiHandlerProvider = Provider<ApiHandler>((ref) {
  return ApiHandler(DioHandler.dio);
});

class ApiHandler {
  final Dio dio;
  ApiHandler(this.dio);

  Future<Response> get(String path) async {
    return await dio.get(path);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return await dio.post(path, data: data);
  }
}
