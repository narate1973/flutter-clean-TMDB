import 'package:dartz/dartz.dart';
import 'package:nutthemovie/core/app_type_def.dart';
import 'package:nutthemovie/core/exception/code5XX/inter_error_exception.dart';
import 'package:nutthemovie/core/group_data/two.dart';
import 'package:nutthemovie/core/remote_datasource/remote_datasource.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_credit_response.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_detail_response.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_list_response.dart';

abstract class MovieRemoteDatasource {
  Future<EitherException<Two<MovieListResponse, List<MovieDetailResponse>>>> getPopMovie();

  Future<EitherException<Two<MovieListResponse, List<MovieDetailResponse>>>> getShowingMovie();

  Future<EitherException<MovieCreditResponse>> getMovieCredit({required String movieID});
}

class MovieRemoteDatasourceImpl extends RemoteDatasource implements MovieRemoteDatasource {
  static const String popMovie = 'popular';
  static const String showingMovie = 'now_playing';

  static String getMoviePath(String movieType) =>
      'movie/$movieType?api_key=52f478e292ed35ceb8701fdd71cb7e41&language=en-US&page=3';

  static String getMovieDetailPath(String movieID) =>
      'movie/$movieID?api_key=52f478e292ed35ceb8701fdd71cb7e41&language=en-US';

  static String getMovieCreditPath(String movieID) =>
      'movie/$movieID/credits?api_key=52f478e292ed35ceb8701fdd71cb7e41&language=en-US';

  @override
  Future<EitherException<MovieCreditResponse>> getMovieCredit({required String movieID}) async {
    try {
      return Right(await get(getMovieCreditPath(movieID), converter: MovieCreditResponse.fromMap));
    } catch (_) {
      return const Left(InternalErrorException());
    }
  }

  @override
  Future<EitherException<Two<MovieListResponse, List<MovieDetailResponse>>>> getPopMovie() =>
      _getMovie(popMovie);

  @override
  Future<EitherException<Two<MovieListResponse, List<MovieDetailResponse>>>> getShowingMovie() =>
      _getMovie(showingMovie);

  Future<EitherException<Two<MovieListResponse, List<MovieDetailResponse>>>> _getMovie(
    String movieType,
  ) async {
    try {
      final MovieListResponse movie =
          await get(getMoviePath(movieType), converter: MovieListResponse.fromMap);

      final List<MovieDetailResponse> movieDetailList = await Future.wait(
        movie.results.map((data) async => await _getMovieInfo(data.id.toString())),
      );
      final Two<MovieListResponse, List<MovieDetailResponse>> two =
          Two(first: movie, second: movieDetailList);
      return Right(two);
    } catch (_) {
      return const Left(InternalErrorException());
    }
  }

  Future<MovieDetailResponse> _getMovieInfo(String movieID) =>
      get(getMovieDetailPath(movieID), converter: MovieDetailResponse.fromMap);
}
