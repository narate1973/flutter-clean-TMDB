import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_movie_cast_usecase.dart';

import '../../../domain/entity/cast_entity.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieCastUseCase _getMovieCastUseCase;

  MovieDetailCubit({required GetMovieCastUseCase getMovieCastUseCase})
      : _getMovieCastUseCase = getMovieCastUseCase,
        super(MovieDetailInitial());

  Future<void> fetchDetail({required MovieEntity movieEntity}) async {
    emit(MovieDetailLoading());
    final result = await _getMovieCastUseCase(movieEntity.movieID);
    result.fold(
      (l) => emit(MovieDetailFailed()),
      (r) => emit(
        MovieDetailSuccess(
          castList: r.castList,
          title: movieEntity.title,
          imageURL: movieEntity.posterURL,
          rating: movieEntity.rating,
          overview: movieEntity.overview,
        ),
      ),
    );
  }
}
