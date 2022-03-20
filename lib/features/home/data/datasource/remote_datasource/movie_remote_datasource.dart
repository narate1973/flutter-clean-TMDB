import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_credit_response.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_detail_response.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_list_response.dart';

import '../../../../../core/core.dart';

typedef MovieListType = Two<MovieListResponse, List<MovieDetailResponse>>;

abstract class MovieRemoteDatasource {
  Future<MovieListType> getPopMovie();

  Future<MovieListType> getShowingMovie();

  Future<MovieCreditResponse> getMovieCredit({required String movieID});
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
  Future<MovieCreditResponse> getMovieCredit({required String movieID}) =>
      get(getMovieCreditPath(movieID), converter: MovieCreditResponse.fromMap);

  @override
  Future<MovieListType> getPopMovie() => _getMovie(popMovie);

  @override
  Future<MovieListType> getShowingMovie() => _getMovie(showingMovie);

  Future<MovieListType> _getMovie(
    String movieType,
  ) async {
    final MovieListResponse movie =
        await get(getMoviePath(movieType), converter: MovieListResponse.fromMap);

    final List<MovieDetailResponse> movieDetailList = await Future.wait(
      movie.results.map((data) async => await _getMovieInfo(data.id.toString())),
    );
    final Two<MovieListResponse, List<MovieDetailResponse>> two =
        Two(first: movie, second: movieDetailList);
    return two;
  }

  Future<MovieDetailResponse> _getMovieInfo(String movieID) =>
      get(getMovieDetailPath(movieID), converter: MovieDetailResponse.fromMap);
}
