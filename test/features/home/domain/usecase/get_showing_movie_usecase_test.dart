import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nutthemovie/core/exception/code5XX/inter_error_exception.dart';
import 'package:nutthemovie/core/failure/failure.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_showing_movie_usecase.dart';

import 'get_pop_movie_usecase_test.mocks.dart';

void main() {
  late GetShowingMovieUseCase useCase;
  late MockMovieRepo mockMovieRepo;

  setUp(() {
    mockMovieRepo = MockMovieRepo();
    useCase = GetShowingMovieUseCase(movieRepository: mockMovieRepo);
  });

  const tMovieList = MovieListEntity.mock;

  test(
    'should get tMovie when useCase call successfully',
        () async {
      when(mockMovieRepo.getShowingMovie()).thenAnswer((_) async => const Right(tMovieList));

      final result = await useCase();

      expect(result, const Right(tMovieList));
      verify(mockMovieRepo.getShowingMovie());
    },
  );

  test(
    'should get return serverFailure when repo return serverException',
        () async {
      when(mockMovieRepo.getShowingMovie())
          .thenAnswer((_) async => const Left(InternalErrorException()));

      final result = await useCase();

      expect(result, Left(ServerFailure()));
      verify(mockMovieRepo.getShowingMovie());
    },
  );
}
