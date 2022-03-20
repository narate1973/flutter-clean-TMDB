import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:nutthemovie/core/core.dart';
import 'package:nutthemovie/features/home/domain/entity/cast_entity.dart';

import '../repository/movie_repo.dart';

class GetMovieCastUseCase implements UseCase<CastListEntity, String> {
  final MovieRepo movieRepository;

  GetMovieCastUseCase({required this.movieRepository});

  @override
  FutureOr<EitherFailure<CastListEntity>> call(String params) async {
    final result = await movieRepository.getMovieCast(movieID: params);
    return result.fold(
      (l) => Left(ServerFailure()),
      (r) => Right(r),
    );
  }
}
