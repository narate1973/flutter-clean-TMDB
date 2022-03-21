import 'package:nutthemovie/core/core.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/movie_remote_datasource.dart';
import 'package:nutthemovie/features/home/domain/entity/cast_entity.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/domain/repository/movie_repo.dart';

import '../datasource/remote_datasource/response/movie_credit_response.dart';

class MovieRepoImpl implements MovieRepo {
  final MovieRemoteDatasource movieRemoteDatasource;

  MovieRepoImpl({required this.movieRemoteDatasource});

  @override
  Future<EitherException<MovieListEntity>> getPopMovie() =>
      NetworkBoundResource.future<MovieListEntity, MovieListType>(
        createCall: () => movieRemoteDatasource.getPopMovie(),
        converter: (response) => MovieListEntity.fromResponse(response),
      );

  @override
  Future<EitherException<MovieListEntity>> getShowingMovie() =>
      NetworkBoundResource.future<MovieListEntity, MovieListType>(
        createCall: () => movieRemoteDatasource.getShowingMovie(),
        converter: (response) => MovieListEntity.fromResponse(response),
      );

  @override
  Future<EitherException<CastListEntity>> getMovieCast({required String movieID}) =>
      NetworkBoundResource.future<CastListEntity, MovieCreditResponse>(
        createCall: () => movieRemoteDatasource.getMovieCredit(movieID: movieID),
        converter: (response) => CastListEntity.fromResponse(response),
      );
}
