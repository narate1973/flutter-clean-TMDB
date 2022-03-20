import 'package:flutter/material.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/presentation/view/component/molecule/movie_card.dart';

class MovieCardList extends StatelessWidget {
  final MovieListEntity movieList;

  const MovieCardList({
    required this.movieList,
  }) : super(key: const Key('movieCardList'));

  @override
  Widget build(BuildContext context) {
    final _movieList = movieList.movieList;
    return ListView.builder(
      itemCount: movieList.movieList.length,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: MovieCard(movieEntity: _movieList[index]),
        );
      },
    );
  }
}
