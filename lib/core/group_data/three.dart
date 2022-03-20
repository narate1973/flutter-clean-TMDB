
import 'package:equatable/equatable.dart';

class Three<A, B, C> with EquatableMixin {
  const Three({
    required this.first,
    required this.second,
    required this.third,
  });

  final A first;
  final B second;
  final C third;

  @override
  List<Object?> get props => [first, second, third];

  @override
  bool? get stringify => true;
}
