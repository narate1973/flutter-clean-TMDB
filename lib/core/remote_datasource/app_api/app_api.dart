import 'package:dio/dio.dart';
import 'package:nutthemovie/core/remote_datasource/app_api/log_interceptor.dart';

import 'error_handler_interceptor.dart';

class AppApi {
  static final Dio _dio = Dio();

  AppApi._internal() {
    _dio.options.connectTimeout = 10000;
    _dio.options.receiveTimeout = 10000;
    _dio.interceptors.addAll([
      NetworkErrorHandlerInterceptor(),
      HttpLogInterceptor(),
    ]);
  }

  Dio get dio => _dio;

  static final _singleton = AppApi._internal();

  factory AppApi() => _singleton;

  static setUp({required String baseURL}) {
    _dio.options.baseUrl = baseURL;
  }
}
