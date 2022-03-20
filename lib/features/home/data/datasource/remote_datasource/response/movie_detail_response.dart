import 'package:equatable/equatable.dart';

class MovieDetailResponse extends Equatable {
  const MovieDetailResponse({required this.genres});

  final List<Genre> genres;

  factory MovieDetailResponse.fromMap(Map<String, dynamic> json) => MovieDetailResponse(
        genres: List<Genre>.from(json['genres'].map((x) => Genre.fromMap(x))),
      );

  static const mock = MovieDetailResponse(genres: [Genre.mock]);

  @override
  List<Object?> get props => [genres];
}

class Genre extends Equatable {
  const Genre({required this.id, required this.name});

  final int id;
  final String name;

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json['id'],
        name: json['name'],
      );

  static const mock = Genre(id: 1, name: '');

  @override
  List<Object?> get props => [id, name];
}
