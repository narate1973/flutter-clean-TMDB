import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:nutthemovie/core/core.dart';

import '../entity/movie_list_entity.dart';
import '../repository/movie_repo.dart';

class GetShowingMovieUseCase implements UseCaseNoParams<MovieListEntity> {
  final MovieRepo movieRepository;

  GetShowingMovieUseCase({required this.movieRepository});

  @override
  FutureOr<EitherFailure<MovieListEntity>> call()async {
    final result = await movieRepository.getShowingMovie();
    return result.fold(
          (l) => Left(ServerFailure()),
          (r) => Right(r),
    );
  }
}
