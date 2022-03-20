import 'dart:async';
import 'package:equatable/equatable.dart';
import 'app_type_def.dart';

abstract class UseCase<Type, Params> {
  FutureOr<EitherFailure<Type>> call(Params params);
}

abstract class UseCaseNoParams<Type> {
  FutureOr<EitherFailure<Type>> call();
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
