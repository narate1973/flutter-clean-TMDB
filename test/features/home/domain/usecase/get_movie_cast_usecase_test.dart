import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nutthemovie/core/core.dart';
import 'package:nutthemovie/core/exception/code5XX/inter_error_exception.dart';
import 'package:nutthemovie/features/home/domain/entity/cast_entity.dart';
import 'package:nutthemovie/features/home/domain/usecase/get_movie_cast_usecase.dart';

import 'get_pop_movie_usecase_test.mocks.dart';

void main() {
  late GetMovieCastUseCase useCase;
  late MockMovieRepo mockMovieRepo;

  setUp(() {
    mockMovieRepo = MockMovieRepo();
    useCase = GetMovieCastUseCase(movieRepository: mockMovieRepo);
  });

  const tCastList = CastListEntity.mock;
  const tMovieID = 'movieID';

  test(
    'should get tCastList when useCase call successfully',
    () async {
      when(mockMovieRepo.getMovieCast(movieID: anyNamed('movieID')))
          .thenAnswer((_) async => const Right(tCastList));

      final result = await useCase(tMovieID);

      expect(result, const Right(tCastList));
      verify(mockMovieRepo.getMovieCast(movieID: tMovieID));
    },
  );

  test(
    'should get serverException when useCase call unsuccessfully',
    () async {
      when(mockMovieRepo.getMovieCast(movieID: anyNamed('movieID')))
          .thenAnswer((_) async => const Left(InternalErrorException()));

      final result = await useCase(tMovieID);

      expect(result, Left(ServerFailure()));
      verify(mockMovieRepo.getMovieCast(movieID: tMovieID));
    },
  );
}
