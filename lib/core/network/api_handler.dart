import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<ApiHandler>((ref) {
  return ApiHandler(Dio());
});

class ApiHandler {
  final Dio dio;

  ApiHandler(this.dio);

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) async {
    return dio.post(path, data: data);
  }
}
