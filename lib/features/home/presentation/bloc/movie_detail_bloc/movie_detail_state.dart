part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailSuccess extends MovieDetailState {
  final String imageURL;
  final String title;
  final double rating;
  final String overview;
  final List<CastEntity> castList;

  const MovieDetailSuccess({
    required this.castList,
    required this.title,
    required this.imageURL,
    required this.rating,
    required this.overview,
  });

  @override
  List<Object> get props => [
        castList,
        title,
        imageURL,
        rating,
        overview,
      ];
}

class MovieDetailFailed extends MovieDetailState {
  @override
  List<Object> get props => [];
}
