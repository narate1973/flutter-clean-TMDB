import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutthemovie/features/home/presentation/bloc/movie_list_cubit/movie_list_cubit.dart';

class HomePageError extends StatelessWidget {
  const HomePageError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieCubit = context.read<MovieListCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        movieCubit.getMovieList();
      },
      child: ListView(
        children: const [
          SizedBox(height: 20),
          Center(child: Text('Something went wrong', style: TextStyle(color: Colors.red))),
          SizedBox(height: 20),
          Center(child: Text('Please try again later', style: TextStyle(color: Colors.red))),
        ],
      ),
    );
  }
}
