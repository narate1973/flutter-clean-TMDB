import 'network4xx_exception.dart';

class BadRequestException extends Network4XXException {
  const BadRequestException({required String service, int code = 400, String? message})
      : super(service: service, code: code, message: message ?? 'Bad request.');
}
