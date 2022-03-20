import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nutthemovie/core/core.dart';
import 'package:nutthemovie/core/exception/code5XX/inter_error_exception.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/domain/repository/movie_repo.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_pop_movie_usecase.dart';

import 'get_pop_movie_usecase_test.mocks.dart';


@GenerateMocks([MovieRepo])
void main() {
  late GetPopMovieUseCase useCase;
  late MockMovieRepo mockMovieRepo;

  setUp(() {
    mockMovieRepo = MockMovieRepo();
    useCase = GetPopMovieUseCase(movieRepository: mockMovieRepo);
  });

  const tMovieList = MovieListEntity.mock;

  test(
    'should get tMovie when useCase call successfully',
    () async {
      when(mockMovieRepo.getPopMovie()).thenAnswer((_) async => const Right(tMovieList));

      final result = await useCase();

      expect(result, const Right(tMovieList));
      verify(mockMovieRepo.getPopMovie());
    },
  );

  test(
    'should get return serverFailure when repo return serverException',
    () async {
      when(mockMovieRepo.getPopMovie())
          .thenAnswer((_) async => const Left(InternalErrorException()));

      final result = await useCase();

      expect(result, Left(ServerFailure()));
      verify(mockMovieRepo.getPopMovie());
    },
  );
}
