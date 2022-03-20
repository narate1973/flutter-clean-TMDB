import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nutthemovie/core/exception/code5XX/inter_error_exception.dart';
import 'package:nutthemovie/core/group_data/two.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/movie_remote_datasource.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_credit_response.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_detail_response.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_list_response.dart';
import 'package:nutthemovie/features/home/data/repository/movie_repo.dart';
import 'package:nutthemovie/features/home/domain/entity/cast_entity.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';

import 'movie_repo_test.mocks.dart';

@GenerateMocks([MovieRemoteDatasource])
void main() {
  late MovieRepoImpl movieRepoImpl;
  late MockMovieRemoteDatasource mockMovieRemoteDatasource;

  setUp(() {
    mockMovieRemoteDatasource = MockMovieRemoteDatasource();
    movieRepoImpl = MovieRepoImpl(movieRemoteDatasource: mockMovieRemoteDatasource);
  });

  const tMovieID = 'movieID';
  const tCreditResponse = MovieCreditResponse.mock;
  const tTwo = Two(first: MovieListResponse.mock, second: [MovieDetailResponse.mock]);
  final movieEntity = MovieListEntity.fromResponse(tTwo);
  final castList = CastListEntity.fromResponse(tCreditResponse);

  group('movieRepo.getMovieCast()', () {
    test(
      'should get CastListEntity when datasource call successfully',
          () async {
        when(mockMovieRemoteDatasource.getMovieCredit(movieID: anyNamed('movieID'))).thenAnswer((_) async => const Right(tCreditResponse));

        final result = await movieRepoImpl.getMovieCast(movieID: tMovieID);

        verify(mockMovieRemoteDatasource.getMovieCredit(movieID: tMovieID));
        expect(result, Right(castList));
      },
    );

    test(
      'should get internalException when datasource call unsuccessfully',
          () async {
        when(mockMovieRemoteDatasource.getMovieCredit(movieID: anyNamed('movieID')))
            .thenAnswer((_) async => const Left(InternalErrorException()));

        final result = await movieRepoImpl.getMovieCast(movieID: tMovieID);

        verify(mockMovieRemoteDatasource.getMovieCredit(movieID: tMovieID));
        expect(result, const Left(InternalErrorException()));
      },
    );
  });

  group('movieRepo.getShowingMovie()', () {
    test(
      'should get tMovieEntity when datasource call successfully',
          () async {
        when(mockMovieRemoteDatasource.getShowingMovie()).thenAnswer((_) async => const Right(tTwo));

        final result = await movieRepoImpl.getShowingMovie();

        verify(mockMovieRemoteDatasource.getShowingMovie());
        expect(result, Right(movieEntity));
      },
    );

    test(
      'should get internalException when datasource call unsuccessfully',
          () async {
        when(mockMovieRemoteDatasource.getShowingMovie())
            .thenAnswer((_) async => const Left(InternalErrorException()));

        final result = await movieRepoImpl.getShowingMovie();

        verify(mockMovieRemoteDatasource.getShowingMovie());
        expect(result, const Left(InternalErrorException()));
      },
    );
  });

  group('movieRepo.getPopMovie()', () {
    test(
      'should get tMovieEntity when datasource call successfully',
      () async {
        when(mockMovieRemoteDatasource.getPopMovie()).thenAnswer((_) async => const Right(tTwo));

        final result = await movieRepoImpl.getPopMovie();

        verify(mockMovieRemoteDatasource.getPopMovie());
        expect(result, Right(movieEntity));
      },
    );

    test(
      'should get internalException when datasource call unsuccessfully',
      () async {
        when(mockMovieRemoteDatasource.getPopMovie())
            .thenAnswer((_) async => const Left(InternalErrorException()));

        final result = await movieRepoImpl.getPopMovie();

        verify(mockMovieRemoteDatasource.getPopMovie());
        expect(result, const Left(InternalErrorException()));
      },
    );
  });
}
