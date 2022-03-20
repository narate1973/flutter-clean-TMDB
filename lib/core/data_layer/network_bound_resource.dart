import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:nutthemovie/core/app_type_def.dart';

class NetworkBoundResource<E, R> {
  NetworkBoundResource._();

  static Future<EitherException<E>> future<E, R>({
    required Future<R> Function() createCall,
    FutureOr<E> Function(R response)? converter,
    Function(Object error, StackTrace stackTrace)? error,
    FutureOr? Function(E item)? saveCallResult,
  }) async {
    try {
      final R response = await createCall();
      late E data;
      if (converter != null) {
        final E convertedData = await converter(response);
        data = convertedData;
      } else {
        final E castedData = response as E;
        data = castedData;
      }

      if (saveCallResult != null) {
        await saveCallResult(data);
      }
      return Right(data);
    } catch (exception, stackTrace) {
      return Left(error?.call(exception, stackTrace) ?? exception as Exception);
    }
  }
}
