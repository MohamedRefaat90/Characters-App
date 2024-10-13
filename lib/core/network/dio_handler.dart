import 'package:characters_app/core/services/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHandler {
  final Dio dio;

  DioHandler()
      : dio = Dio()
          ..options.baseUrl = 'http://10.0.2.2:8000/'
          ..options.connectTimeout = const Duration(seconds: 20)
          ..options.receiveTimeout = const Duration(seconds: 20)
          ..interceptors.add(PrettyDioLogger(
            requestBody: true,
            responseBody: true,
            requestHeader: false,
            responseHeader: false,
            logPrint: (object) => debugPrint(object.toString()),
          ));

  Future<void> setToken() async {
    final token = await SecureStorage.read('token');
    if (token != null && token.trim().isNotEmpty) {
      dio.options.headers = {
        "Authorization": "Token ${token.trim()}",
      };
    } else {
      dio.options.headers = null;
    }
  }

  Dio getDio() {
    setToken();
    return dio;
  }
}
