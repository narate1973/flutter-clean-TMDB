import 'dart:convert';

import 'base_request.dart';

abstract class RequestBody extends BaseRequest {
  const RequestBody();

  Map<String, Object?> toJson();

  String toJsonStr() => json.encode(toJson());
}
