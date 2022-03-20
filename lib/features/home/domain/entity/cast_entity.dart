import 'package:equatable/equatable.dart';
import 'package:nutthemovie/features/home/data/datasource/remote_datasource/response/movie_credit_response.dart';

class CastListEntity extends Equatable {
  final List<CastEntity> castList;

  const CastListEntity({required this.castList});

  factory CastListEntity.fromResponse(MovieCreditResponse response) => CastListEntity(
      castList: List.from(response.cast.map((data) => CastEntity.fromResponse(data))));

  static const mock = CastListEntity(castList: [CastEntity.mock]);

  @override
  List<Object?> get props => [castList];
}

class CastEntity extends Equatable {
  final String imageURL;
  final String name;

  const CastEntity({required this.imageURL, required this.name});

  factory CastEntity.fromResponse(Cast cast) => CastEntity(
        imageURL: cast.profilePath,
        name: cast.name,
      );

  static const mock = CastEntity(imageURL: '', name: '');

  @override
  List<Object?> get props => [imageURL, name];
}
