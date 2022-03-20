import 'package:flutter/material.dart';

class RatingHolder extends StatelessWidget {
  final double rating;

  const RatingHolder({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 16,
        ),
        Text(rating.toString())
      ],
    );
  }
}
