import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nutthemovie/core/core.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_pop_movie_usecase.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_showing_movie_usecase.dart';
import 'package:nutthemovie/features/home/presentation/bloc/movie_list_cubit/movie_list_cubit.dart';

import 'movie_list_cubit_test.mocks.dart';


@GenerateMocks([GetPopMovieUseCase, GetShowingMovieUseCase])
void main() {
  late MovieListCubit cubit;
  late MockGetPopMovieUseCase mockGetPopMovieUseCase;
  late MockGetShowingMovieUseCase mockGetShowingMovieUseCase;

  setUp(() {
    mockGetPopMovieUseCase = MockGetPopMovieUseCase();
    mockGetShowingMovieUseCase = MockGetShowingMovieUseCase();
    cubit = MovieListCubit(
      getShowingMovieUseCase: mockGetShowingMovieUseCase,
      getMovieListUseCase: mockGetPopMovieUseCase,
    );
  });

  const tMovieList = MovieListEntity.mock;

  group('mockGetShowingMovieUseCase by MovieListCubit', () {
    void setUpSuccessMockGetShowingMovieUseCase() {
      when(mockGetShowingMovieUseCase()).thenAnswer((_) async => const Right(tMovieList));
    }

    blocTest(
      'should get data from GetShowingMovieUseCase',
      build: () {
        setUpSuccessMockGetShowingMovieUseCase();
        return cubit;
      },
      act: (MovieListCubit cubit) {
        cubit.getShowingMovie();
      },
      verify: (_) {
        verify(mockGetShowingMovieUseCase());
      },
    );

    blocTest(
      'should emit [MovieListLoading, MovieListSuccess] when mockGetShowingMovieUseCase is gotten successfully',
      build: () {
        setUpSuccessMockGetShowingMovieUseCase();
        return cubit;
      },
      act: (MovieListCubit cubit) {
        cubit.getShowingMovie();
      },
      expect: () => [
        MovieListLoading(),
        const MovieListSuccess(movieList: tMovieList),
      ],
    );

    blocTest(
      'should emit [MovieListLoading, MovieListFailed] when mockGetShowingMovieUseCase is gotten unsuccessfully',
      build: () {
        when(mockGetShowingMovieUseCase()).thenAnswer((_) async => Left(ServerFailure()));
        return cubit;
      },
      act: (MovieListCubit cubit) {
        cubit.getShowingMovie();
      },
      expect: () => [
        MovieListLoading(),
        MovieListFailed(),
      ],
    );
  });

  group('mockGetPopMovieUseCase by MovieListCubit', () {
    void setUpSuccessMockGetPopMovieUseCase() {
      when(mockGetPopMovieUseCase()).thenAnswer((_) async => const Right(tMovieList));
    }

    blocTest(
      'should get data from GetPopMovieUseCase',
      build: () {
        setUpSuccessMockGetPopMovieUseCase();
        return cubit;
      },
      act: (MovieListCubit cubit) {
        cubit.getPopMovie();
      },
      verify: (_) {
        verify(mockGetPopMovieUseCase());
      },
    );

    blocTest(
      'should emit [MovieListLoading, MovieListSuccess] when mockGetPopMovieUseCase is gotten successfully',
      build: () {
        setUpSuccessMockGetPopMovieUseCase();
        return cubit;
      },
      act: (MovieListCubit cubit) {
        cubit.getPopMovie();
      },
      expect: () => [
        MovieListLoading(),
        const MovieListSuccess(movieList: tMovieList),
      ],
    );

    blocTest(
      'should emit [MovieListLoading, MovieListFailed] when mockGetPopMovieUseCase is gotten unsuccessfully',
      build: () {
        when(mockGetPopMovieUseCase()).thenAnswer((_) async => Left(ServerFailure()));
        return cubit;
      },
      act: (MovieListCubit cubit) {
        cubit.getPopMovie();
      },
      expect: () => [
        MovieListLoading(),
        MovieListFailed(),
      ],
    );
  });
}
