import 'package:equatable/equatable.dart';

abstract class BaseRequest with EquatableMixin {
  const BaseRequest();

  @override
  bool get stringify => true;
}
