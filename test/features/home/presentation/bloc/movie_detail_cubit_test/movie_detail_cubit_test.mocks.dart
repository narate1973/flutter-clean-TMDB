// Mocks generated by Mockito 5.1.0 from annotations
// in nutthemovie/test/features/home/presentation/bloc/movie_detail_cubit_test/movie_detail_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:nutthemovie/core/core.dart' as _i6;
import 'package:nutthemovie/features/home/domain/entity/cast_entity.dart'
    as _i7;
import 'package:nutthemovie/features/home/domain/repository/movie_repo.dart'
    as _i2;
import 'package:nutthemovie/features/home/domain/usecase/get_movie_cast_usecase.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMovieRepo_0 extends _i1.Fake implements _i2.MovieRepo {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetMovieCastUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieCastUseCase extends _i1.Mock
    implements _i4.GetMovieCastUseCase {
  MockGetMovieCastUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepo get movieRepository =>
      (super.noSuchMethod(Invocation.getter(#movieRepository),
          returnValue: _FakeMovieRepo_0()) as _i2.MovieRepo);
  @override
  _i5.FutureOr<_i3.Either<_i6.Failure, _i7.CastListEntity>> call(
          String? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue:
                  Future<_i3.Either<_i6.Failure, _i7.CastListEntity>>.value(
                      _FakeEither_1<_i6.Failure, _i7.CastListEntity>()))
          as _i5.FutureOr<_i3.Either<_i6.Failure, _i7.CastListEntity>>);
}