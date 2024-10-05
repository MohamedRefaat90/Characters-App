import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioHandler {
  final Dio dio;

  DioHandler()
      : dio = Dio()
          ..options.baseUrl = 'http://127.0.0.1:8000/'
          ..options.connectTimeout = const Duration(seconds: 20)
          ..options.receiveTimeout = const Duration(seconds: 20)
          ..interceptors.add(PrettyDioLogger(
            requestBody: true,
            requestHeader: false,
            responseHeader: false,
            logPrint: (object) => debugPrint(object.toString()),
          ));

  Dio getDio() {
    return dio;
  }
}
