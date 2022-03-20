import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nutthemovie/core/core.dart';
import 'package:nutthemovie/features/home/domain/entity/cast_entity.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_movie_cast_usecase.dart';
import 'package:nutthemovie/features/home/presentation/bloc/movie_detail_bloc/movie_detail_cubit.dart';

import 'movie_detail_cubit_test.mocks.dart';

@GenerateMocks([GetMovieCastUseCase])
void main() {
  late MovieDetailCubit cubit;
  late MockGetMovieCastUseCase mockGetMovieCastUseCase;

  setUp(() {
    mockGetMovieCastUseCase = MockGetMovieCastUseCase();
    cubit = MovieDetailCubit(getMovieCastUseCase: mockGetMovieCastUseCase);
  });

  const tCastEntity = CastListEntity.mock;
  const tMovieEntity = MovieEntity.mock;
  final tMovieDetailSuccess = MovieDetailSuccess(
    castList: const [CastEntity.mock],
    title: tMovieEntity.title,
    imageURL: tMovieEntity.thumbnailURL,
    rating: 1.2,
    overview: tMovieEntity.overview,
  );

  group('GetMovieCastUseCase by MovieDetailCubit', () {
    blocTest(
      'should emit [MovieDetailLoading, MovieDetailSuccess] when mockGetShowingMovieUseCase is gotten successfully',
      build: () {
        when(mockGetMovieCastUseCase(any)).thenAnswer((_) async => const Right(tCastEntity));
        return cubit;
      },
      act: (MovieDetailCubit cubit) {
        cubit.fetchDetail(movieEntity: tMovieEntity);
      },
      expect: () => [
        MovieDetailLoading(),
        tMovieDetailSuccess,
      ],
    );

    blocTest(
      'should emit [MovieDetailLoading, MovieDetailFailed] when mockGetShowingMovieUseCase is gotten unsuccessfully',
      build: () {
        when(mockGetMovieCastUseCase(any)).thenAnswer((_) async => Left(ServerFailure()));
        return cubit;
      },
      act: (MovieDetailCubit cubit) {
        cubit.fetchDetail(movieEntity: tMovieEntity);
      },
      expect: () => [
        MovieDetailLoading(),
        MovieDetailFailed(),
      ],
    );
  });
}
