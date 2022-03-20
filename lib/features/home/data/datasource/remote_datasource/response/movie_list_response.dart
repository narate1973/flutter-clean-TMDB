import 'package:equatable/equatable.dart';
import 'package:nutthemovie/core/core.dart';

class MovieListResponse extends Equatable{
  const MovieListResponse({required this.results});

  final List<Result> results;

  factory MovieListResponse.fromMap(Map<String, dynamic> json) => MovieListResponse(
        results: List<Result>.from(json['results'].map((x) => Result.fromMap(x))),
      );

  static const mock = MovieListResponse(results: [Result.mock]);

  @override
  List<Object?> get props => [results];

}

class Result extends Equatable {
  const Result({
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
  });

  final int id;
  final String overview;
  final String posterPath;
  final String title;
  final double voteAverage;

  static const mock = Result(
    id: 11,
    overview: '',
    posterPath: '',
    title: '',
    voteAverage: 1.2,
  );

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json['id'],
        overview: json['overview'],
        posterPath: convertImageURL(json['poster_path']),
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );

  @override
  List<Object?> get props => [id, overview, posterPath, title, voteAverage];
}
