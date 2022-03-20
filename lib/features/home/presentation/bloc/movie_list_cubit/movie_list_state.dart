part of 'movie_list_cubit.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();
}

class MovieListInitial extends MovieListState {
  @override
  List<Object> get props => [];
}

class MovieListLoading extends MovieListState {
  @override
  List<Object> get props => [];
}

class MovieListSuccess extends MovieListState {
  final MovieListEntity movieList;

  const MovieListSuccess({required this.movieList});

  @override
  List<Object> get props => [movieList];
}

class MovieListFailed extends MovieListState {
  @override
  List<Object> get props => [];
}
