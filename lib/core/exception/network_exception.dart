class NetworkException implements Exception {
  final String service;
  final int code;
  final String? message;

  const NetworkException({
    required this.service,
    this.code = 0,
    this.message,
  });

  @override
  String toString() {
    String msg = '';
    if (service.isNotEmpty) msg += '[$service]\n';

    if (code != 0) msg += '>>Code: $code';

    if (message != null && message!.isNotEmpty) {
      msg += ' | Exception: $message';
    }

    return msg;
  }
}
