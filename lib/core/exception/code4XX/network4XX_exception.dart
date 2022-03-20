import '../network_exception.dart';

class Network4XXException extends NetworkException {
  const Network4XXException({required String service, required int code, String? message})
      : assert(code >= 400 && code < 500, 'Error code not 400 to 500'),
        super(service: service, code: code, message: message);
}
