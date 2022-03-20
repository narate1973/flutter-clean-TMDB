import 'network5xx_exception.dart';

class InternalErrorException extends Network5XXException {
  const InternalErrorException(
      {String service = 'Http Interceptor', int code = 500, String? message = 'Service has something wrong.'})
      : super(service: service, code: code, message: message);
}
