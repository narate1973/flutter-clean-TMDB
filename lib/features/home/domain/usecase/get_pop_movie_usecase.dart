import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:nutthemovie/core/core.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/domain/repository/movie_repo.dart';

class GetPopMovieUseCase implements UseCaseNoParams<MovieListEntity> {
  final MovieRepo movieRepository;

  GetPopMovieUseCase({required this.movieRepository});

  @override
  FutureOr<EitherFailure<MovieListEntity>> call() async {
    final result = await movieRepository.getPopMovie();
    return result.fold(
      (l) => Left(ServerFailure()),
      (r) => Right(r),
    );
  }
}
