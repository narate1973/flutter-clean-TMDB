import 'package:flutter/material.dart';

import '../atom/rating_holder.dart';

class MovieDetailContent extends StatelessWidget {
  final String overview;
  final String title;
  final double rating;
  const MovieDetailContent({
    Key? key,
    required this.overview,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        RatingHolder(rating: rating),
        const SizedBox(height: 8),
        const Text(
          'Overview',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Text(overview),
        ),
        const Text(
          'Casts:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
