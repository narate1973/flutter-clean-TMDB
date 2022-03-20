import 'dart:async';

import 'package:dio/dio.dart';

import 'app_api/app_api.dart';

abstract class RemoteDatasource {
  static final AppApi _appApi = AppApi();

  Future<T> get<T>(
    String endPoint, {
    Map<String, Object>? queryParameters,
    Options? options,
    required FutureOr<T> Function(Map<String, dynamic> json) converter,
  }) {
    return _appApi.dio
        .get(
          endPoint,
          queryParameters: queryParameters,
          options: options,
        )
        .then((value) async => converter(value.data));
  }
}
