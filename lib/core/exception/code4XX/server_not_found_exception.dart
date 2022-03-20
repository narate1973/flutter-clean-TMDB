import 'network4xx_exception.dart';

class ServerNotFoundException extends Network4XXException {
  const ServerNotFoundException({required String service, int code = 404, String? message})
      : super(service: service, code: code, message: message ?? 'Server not found.');
}
