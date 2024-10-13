import 'package:characters_app/core/network/dio_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiHandlerProvider = Provider<ApiHandler>((ref) {
  return ApiHandler(DioHandler().getDio());
});

class ApiHandler {
  final Dio dio;

  ApiHandler(this.dio);

  get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }

  post(String path, {dynamic data}) async {
    return await dio.post(path, data: data);
  }
}
