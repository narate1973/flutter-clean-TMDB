import 'package:flutter/material.dart';
import 'package:nutthemovie/features/home/presentation/view/component/molecule/cast_list_tile.dart';

import '../../../../../../core/app_component/app_network_image/app_network_image.dart';
import '../../../bloc/movie_detail_bloc/movie_detail_cubit.dart';
import '../organism/movie_detail_content.dart';

class MovieDetailTemplate extends StatelessWidget {
  final MovieDetailSuccess movieDetailSuccess;

  const MovieDetailTemplate({
    required this.movieDetailSuccess,
  }) : super(key: const Key('MovieDetailTemplate'));

  @override
  Widget build(BuildContext context) {
    final castList = movieDetailSuccess.castList;
    return ListView.separated(
      itemCount: 2 + castList.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return AppNetWorkImage.rect(
            movieDetailSuccess.imageURL,
            width: double.infinity,
            height: 550,
            maxHeightDiskCache: 900,
            maxWidthDiskCache: 700,
          );
        }
        if (index == 1) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 14.0),
            child: MovieDetailContent(
              overview: movieDetailSuccess.overview,
              title: movieDetailSuccess.title,
              rating: movieDetailSuccess.rating,
            ),
          );
        }
        return CastListTile(
          imageURL: castList[index - 2].imageURL,
          name: castList[index - 2].name,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        if (index > 1) {
          return const Divider(color: Colors.grey);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
