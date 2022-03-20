import 'package:nutthemovie/features/home/domain/entity/cast_entity.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';

import '../../../../core/app_type_def.dart';

abstract class MovieRepo {
  Future<EitherException<MovieListEntity>> getPopMovie();

  Future<EitherException<MovieListEntity>> getShowingMovie();

  Future<EitherException<CastListEntity>> getMovieCast({required String movieID});
}
