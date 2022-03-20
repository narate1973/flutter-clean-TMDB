import 'package:equatable/equatable.dart';
class Two<A, B> with EquatableMixin {
  const Two({
    required this.first,
    required this.second,
  });

  final A first;
  final B second;

  @override
  List<Object?> get props => [first, second];

  @override
  bool? get stringify => true;
}
