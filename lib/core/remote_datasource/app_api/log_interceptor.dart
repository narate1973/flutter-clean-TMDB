import 'dart:convert';

import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// [LogInterceptor] is used to print logs during network requests.
/// It's better to add [LogInterceptor] to the tail of the interceptors queue,
/// otherwise the changes made in the interceptors behind A will not be printed out.
/// This is because the execution of interceptors is in the order of addition.
class HttpLogInterceptor extends Interceptor {
  HttpLogInterceptor({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.logPrint = _logPrintLong,
  });

  final AnsiPen _title = AnsiPen()..white(bold: true);
  final AnsiPen _error = AnsiPen()..red(bold: true);
  final AnsiPen _json = AnsiPen()..green(bold: true);

  /// Print request [Options]
  bool request;

  /// Print request header [Options.headers]
  bool requestHeader;

  /// Print request data [Options.data]
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print [Response.headers]
  bool responseHeader;

  /// Print error message
  bool error;

  /// Log printer; defaults print log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file, for example:
  ///```dart
  ///  var file=File("./log.txt");
  ///  var sink=file.openWrite();
  ///  dio.interceptors.add(LogInterceptor(logPrint: sink.writeln));
  ///  ...
  ///  await sink.close();
  ///```
  void Function(Object? object) logPrint;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!kReleaseMode) {
      logPrint(_title('*** Request ↗️ ***'));
      _printKV('URL', options.uri);
      //options.headers;

      if (request) {
        _printKV('method', _title(options.method));
        _printKV('responseType', options.responseType.toString());
        _printKV('followRedirects', options.followRedirects);
        _printKV('connectTimeout', options.connectTimeout);
        _printKV('sendTimeout', options.sendTimeout);
        _printKV('receiveTimeout', options.receiveTimeout);
        _printKV('receiveDataWhenStatusError', options.receiveDataWhenStatusError);
        _printKV('extra', options.extra);
      }
      if (requestHeader) {
        logPrint('headers:');
        options.headers.forEach((key, v) => _printKV(' $key', _title(v)));
      }
      if (requestBody) {
        JsonEncoder encoder = const JsonEncoder.withIndent('  ');
        final data = options.data;
        String prettyPrint;
        if (data is FormData) {
          logPrint(_json('Form Data:'));
          final newList =
              data.fields.map((MapEntry<String, String> e) => {e.key: e.value}).toList();
          newList.addAll(data.files
              .map((MapEntry<String, MultipartFile> e) => {e.key: _getMultipartFileString(e.value)})
              .toList());
          prettyPrint = encoder.convert(newList);
        } else {
          logPrint(_json('Body Data:'));
          prettyPrint = encoder.convert(data);
        }
        _printAll(_json(prettyPrint));
      }
      logPrint('');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (!kReleaseMode) {
      logPrint(_title('*** Response ↙️ ***'));
      _printResponse(response);
    }
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (!kReleaseMode) {
      if (error) {
        logPrint(_error('*** DioError ❌ ***:'));
        logPrint('URL: ${err.requestOptions.uri}');
        logPrint('$err');
        final response = err.response;
        if (response != null) {
          _printResponse(response);
        }
        logPrint('');
      }
    }

    handler.next(err);
  }

  void _printResponse(Response response) {
    if (!kReleaseMode) {
      _printKV('URL', response.requestOptions.uri);
      if (responseHeader) {
        _printKV('statusCode', response.statusCode ?? 0);
        if (response.isRedirect == true) {
          _printKV('redirect', response.realUri);
        }

        logPrint('headers:');
        response.headers.forEach((key, v) => _printKV(' $key', v.join('\r\n\t')));
      }
      if (responseBody) {
        logPrint(_json('Response Text:'));
        JsonEncoder encoder = const JsonEncoder.withIndent('  ');
        String prettyPrint = encoder.convert(response.data);
        _printAll(_json(prettyPrint));
      }
      logPrint('');
    }
  }

  void _printKV(String key, Object v) {
    if (!kReleaseMode) {
      logPrint('$key: $v');
    }
  }

  void _printAll(msg) {
    if (!kReleaseMode) {
      msg.toString().split('\n').forEach(logPrint);
    }
  }

  String _getMultipartFileString(MultipartFile file) {
    return 'Header: ${file.headers}, '
        'Content type: ${file.contentType}, '
        'File name: ${file.filename}, '
        'Length: ${file.length}';
  }

  static void _logPrintLong(Object? object) async {
    if (!kReleaseMode) {
      int defaultPrintLength = 1020;
      if (object == null || object.toString().length <= defaultPrintLength) {
        print(object);
      } else {
        String log = object.toString();
        int start = 0;
        int endIndex = defaultPrintLength;
        int logLength = log.length;
        int tmpLogLength = log.length;
        while (endIndex < logLength) {
          print(log.substring(start, endIndex));
          endIndex += defaultPrintLength;
          start += defaultPrintLength;
          tmpLogLength -= defaultPrintLength;
        }
        if (tmpLogLength > 0) {
          print(log.substring(start, logLength));
        }
      }
    }
  }
}
