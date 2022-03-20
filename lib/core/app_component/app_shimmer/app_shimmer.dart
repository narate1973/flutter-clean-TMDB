import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

enum SkeletonDirection { horizontal, vertical }

class AppShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final BorderRadius borderRadius;
  final BoxShape boxShape;
  final SkeletonDirection? direction;
  final _random = Random();

  AppShimmer._({
    Key? key,
    this.width,
    this.height,
    this.direction,
    required this.borderRadius,
    required this.color,
    required this.boxShape,
  }) : super(key: key);

  static Widget circle({
    required double size,
    required Color color,
  }) =>
      AppShimmer._(
        width: size,
        height: size,
        color: color,
        boxShape: BoxShape.circle,
        borderRadius: BorderRadius.circular(0),
      );

  static Widget rect({
    double? width,
    double? height,
    Color color = Colors.grey,
    BorderRadius? borderRadius,
  }) =>
      AppShimmer._(
        width: width,
        height: height,
        color: color,
        boxShape: BoxShape.rectangle,
        borderRadius: borderRadius ?? BorderRadius.circular(0),
      );

  @override
  Widget build(BuildContext context) {
    switch (boxShape) {
      case BoxShape.rectangle:
        return _buildRect(context);
      case BoxShape.circle:
        return _buildCircle(context);
      default:
        return _buildRect(context);
    }
  }

  Widget _buildCircle(BuildContext context) {
    return ClipOval(
      child: Shimmer(
        duration: const Duration(milliseconds: 700),
        interval: const Duration(milliseconds: 800),
        color: Colors.white,
        colorOpacity: 0.4,
        direction: const ShimmerDirection.fromLTRB(),
        child: Container(
          width: width,
          height: height,
          color: color,
        ),
      ),
    );
  }

  Widget _buildRect(BuildContext context) {
    final box = context.findRenderObject() as RenderBox?;
    return ClipRRect(
      borderRadius: borderRadius,
      child: Shimmer(
        duration: const Duration(milliseconds: 700),
        interval: const Duration(milliseconds: 800),
        color: Colors.white,
        colorOpacity: 0.4,
        direction: const ShimmerDirection.fromLTRB(),
        //Default Value
        child: Container(
          width: box == null
              ? width
              : direction == SkeletonDirection.horizontal
                  ? _randomSize(box.size.width)
                  : box.size.width,
          height: box == null
              ? height
              : direction == SkeletonDirection.vertical
                  ? _randomSize(box.size.height)
                  : box.size.height,
          color: color,
        ),
      ),
    );
  }

  double _randomSize(double size) {
    final double min = size * 3 / 4;
    final double max = size;
    return min + _random.nextInt(max.toInt() - min.toInt());
  }
}
