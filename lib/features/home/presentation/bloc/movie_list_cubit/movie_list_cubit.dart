import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_pop_movie_usecase.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_showing_movie_usecase.dart';

part 'movie_list_state.dart';

class MovieListCubit extends Cubit<MovieListState> {
  final GetPopMovieUseCase _getMovieListUseCase;
  final GetShowingMovieUseCase _getShowingMovieUseCase;

  MovieListCubit({
    required GetPopMovieUseCase getMovieListUseCase,
    required GetShowingMovieUseCase getShowingMovieUseCase,
  })  : _getMovieListUseCase = getMovieListUseCase,
        _getShowingMovieUseCase = getShowingMovieUseCase,
        super(MovieListInitial());

  Future<void> getShowingMovie() async {
    emit(MovieListLoading());

    final result = await _getShowingMovieUseCase();
    result.fold(
      (l) {
        emit(MovieListFailed());
      },
      (r) {
        emit(MovieListSuccess(movieList: r));
      },
    );
  }

  Future<void> getPopMovie() async {
    emit(MovieListLoading());

    final result = await _getMovieListUseCase();
    result.fold(
      (l) {
        emit(MovieListFailed());
      },
      (r) {
        emit(MovieListSuccess(movieList: r));
      },
    );
  }
}
