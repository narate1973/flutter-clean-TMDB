import 'package:flutter/cupertino.dart';

class AppPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  AppPageRoute(
    this.child, {
    this.direction = AxisDirection.left,
  }) : super(
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: _getOffsetDirection(),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  Offset _getOffsetDirection() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
      default:
        return const Offset(1, 0);
    }
  }
}
