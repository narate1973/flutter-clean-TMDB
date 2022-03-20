import 'package:get_it/get_it.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/movie_remote_datasource.dart';
import 'package:nutthemovie/features/home/data/repository/movie_repo.dart';
import 'package:nutthemovie/features/home/domain/repository/movie_repo.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_movie_cast_usecase.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_pop_movie_usecase.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_showing_movie_usecase.dart';
import 'package:nutthemovie/features/home/presentation/bloc/movie_detail_bloc/movie_detail_cubit.dart';
import 'package:nutthemovie/features/home/presentation/bloc/movie_list_cubit/movie_list_cubit.dart';
import 'package:nutthemovie/my_app/presentation/bloc/app_cubit/app_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! bloc
  sl.registerFactory(() => AppCubit());
  sl.registerFactory(() => MovieListCubit(getMovieListUseCase: sl(), getShowingMovieUseCase: sl()));
  sl.registerFactory(() => MovieDetailCubit(getMovieCastUseCase: sl()));

  // ! useCase
  sl.registerLazySingleton(() => GetMovieCastUseCase(movieRepository: sl()));
  sl.registerLazySingleton(() => GetShowingMovieUseCase(movieRepository: sl()));
  sl.registerLazySingleton(() => GetPopMovieUseCase(movieRepository: sl()));

  // ! repository
  sl.registerLazySingleton<MovieRepo>(() => MovieRepoImpl(movieRemoteDatasource: sl()));

  // ! datasource
  sl.registerLazySingleton<MovieRemoteDatasource>(() => MovieRemoteDatasourceImpl());
}
