import 'package:characters_app/core/services/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHandler {
  static final Dio dio = Dio();

  DioHandler() {
    _initializeDio();
  }
  // Private method to initialize Dio settings
  void _initializeDio() async {
    dio.options = BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/',
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    initPrettyLogger();
    await tokenHandler();
  }

  initPrettyLogger() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        logPrint: (object) => debugPrint(object.toString()),
      ),
    );
  }

  tokenHandler() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await SecureStorage.read('token');
          if (token != null) {
            options.headers['Authorization'] = 'Token $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Dio getDioWithToken() {
    return dio;
  }
}
