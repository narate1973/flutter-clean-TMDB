import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nutthemovie/features/home/domain/entity/movie_list_entity.dart';
import 'package:nutthemovie/features/home/presentation/bloc/movie_detail_bloc/movie_detail_cubit.dart';
import 'package:nutthemovie/features/home/presentation/view/component/template/movie_detail_template.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage._() : super(key: const Key('MovieDetailPage'));

  static Widget create({required MovieEntity movieEntity}) => BlocProvider(
        create: (context) => GetIt.I<MovieDetailCubit>()..fetchDetail(movieEntity: movieEntity),
        child: const MovieDetailPage._(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieDetailCubit, MovieDetailState>(
        listener: (context, state) {
          if(state is MovieDetailFailed){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is MovieDetailSuccess) {
            return MovieDetailTemplate(movieDetailSuccess: state);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
