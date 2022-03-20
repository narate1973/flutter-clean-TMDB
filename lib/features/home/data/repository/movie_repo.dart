import 'package:dartz/dartz.dart';
import 'package:nutthemovie/core/app_type_def.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/movie_remote_datasource.dart';
import 'package:nutthemovie/features/home/domain/entity/cast_entity.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/domain/repository/movie_repo.dart';

class MovieRepoImpl implements MovieRepo {
  final MovieRemoteDatasource movieRemoteDatasource;

  MovieRepoImpl({required this.movieRemoteDatasource});

  @override
  Future<EitherException<MovieListEntity>> getPopMovie() async {
    final movieList = await movieRemoteDatasource.getPopMovie();
    return movieList.fold(
      (l) => Left(l),
      (r) => Right(MovieListEntity.fromResponse(r)),
    );
  }

  @override
  Future<EitherException<MovieListEntity>> getShowingMovie() async {
    final movieList = await movieRemoteDatasource.getShowingMovie();
    return movieList.fold(
      (l) => Left(l),
      (r) => Right(MovieListEntity.fromResponse(r)),
    );
  }

  @override
  Future<EitherException<CastListEntity>> getMovieCast({required String movieID}) async {
    final movieCredit = await movieRemoteDatasource.getMovieCredit(movieID: movieID);
    return movieCredit.fold(
      (l) => Left(l),
      (r) => Right(CastListEntity.fromResponse(r)),
    );
  }
}
