import '../network_exception.dart';

class Network5XXException extends NetworkException {
  const Network5XXException({
    required String service,
    required int code,
    String? message,
  })  : assert(code >= 500 && code < 600, 'Error code not 500 to 600'),
        super(service: service, code: code, message: message);
}
