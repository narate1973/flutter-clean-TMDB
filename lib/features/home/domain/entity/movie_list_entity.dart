import 'package:dartx/dartx.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/group_data/two.dart';
import '../../data/datasource/remote_datasource/response/movie_detail_response.dart';
import '../../data/datasource/remote_datasource/response/movie_list_response.dart';

class MovieListEntity extends Equatable {
  final List<MovieEntity> movieList;

  const MovieListEntity({required this.movieList});

  factory MovieListEntity.fromResponse(
    Two<MovieListResponse, List<MovieDetailResponse>> response,
  ) {
    final movieList = response.first;
    final movieDetailList = response.second;
    return MovieListEntity(
      movieList: List.from(
        movieList.results.mapIndexed(
          (index, movie) => MovieEntity(
            posterURL: movie.posterPath,
            thumbnailURL: movie.backDropPath,
            title: movie.title,
            rating: movie.voteAverage,
            genres: _getStringFromGenre(movieDetailList[index]),
            movieID: movie.id.toString(),
            overview: movie.overview,
          ),
        ),
      ),
    );
  }

  static const mock = MovieListEntity(movieList: [
    MovieEntity.mock,
  ]);

  static String _getStringFromGenre(MovieDetailResponse response) {
    final result = response.genres.map((data) => data.name).toList();
    return result.join(', ');
  }

  @override
  List<Object?> get props => [movieList];
}

class MovieEntity extends Equatable {
  final String thumbnailURL;
  final String posterURL;
  final String title;
  final double rating;
  final String genres;
  final String movieID;
  final String overview;

  const MovieEntity({
    required this.thumbnailURL,
    required this.title,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.movieID,
    required this.posterURL,
  });

  static const mock = MovieEntity(
    thumbnailURL: '',
    title: '',
    rating: 1.2,
    genres: '',
    overview: '',
    movieID: '',
    posterURL: '',
  );

  @override
  List<Object?> get props => [thumbnailURL, title, rating, genres, overview, movieID];
}
