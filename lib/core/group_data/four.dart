import 'package:equatable/equatable.dart';

class Four<A, B, C, D> with EquatableMixin {
  const Four({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
  });

  final A first;
  final B second;
  final C third;
  final D fourth;

  @override
  List<Object?> get props => [first, second, third, fourth];

  @override
  bool? get stringify => true;
}
