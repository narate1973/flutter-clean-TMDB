import 'dart:async';

import 'package:dio/dio.dart';

import 'app_api/app_api.dart';
import 'request/request_body.dart';

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

  Future<T> post<T>(
    String endPoint, {
    Map<String, Object>? queryParameters,
    RequestBody? data,
    Options? options,
    required FutureOr<T> Function(Map<String, dynamic> json) converter,
  }) {
    return _appApi.dio
        .post(
          endPoint,
          data: data?.toJson(),
          queryParameters: queryParameters,
          options: options,
        )
        .then((value) async => converter(value.data));
  }

  Future<T> put<T>(
    String endPoint, {
    Map<String, Object>? queryParameters,
    RequestBody? data,
    Options? options,
    required FutureOr<T> Function(Map<String, dynamic> json) converter,
  }) {
    return _appApi.dio
        .put(
          endPoint,
          data: data?.toJson(),
          queryParameters: queryParameters,
          options: options,
        )
        .then((value) async => converter(value.data));
  }

  Future<T> delete<T>(
    String endPoint, {
    Map<String, Object>? queryParameters,
    Options? options,
    RequestBody? data,
    required FutureOr<T> Function(Map<String, dynamic> json) converter,
  }) {
    return _appApi.dio
        .delete(
          endPoint,
          data: data?.toJson(),
          queryParameters: queryParameters,
          options: options,
        )
        .then((value) async => converter(value.data));
  }
}
