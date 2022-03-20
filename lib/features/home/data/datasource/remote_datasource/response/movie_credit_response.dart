import 'package:equatable/equatable.dart';
import 'package:nutthemovie/core/core.dart';

class MovieCreditResponse extends Equatable {
  const MovieCreditResponse({required this.cast});

  final List<Cast> cast;

  factory MovieCreditResponse.fromMap(Map<String, dynamic> json) => MovieCreditResponse(
        cast: List<Cast>.from(json['cast'].map((x) => Cast.fromMap(x))),
      );

  static const mock = MovieCreditResponse(cast: [Cast.mock]);

  @override
  List<Object?> get props => [cast];
}

class Cast extends Equatable {
  const Cast({required this.name, required this.profilePath});

  final String name;
  final String profilePath;

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        name: json['name'],
        profilePath: convertImageURL(json['profile_path']),
      );

  static const mock = Cast(name: '', profilePath: '');

  @override
  List<Object?> get props => [name, profilePath];
}
