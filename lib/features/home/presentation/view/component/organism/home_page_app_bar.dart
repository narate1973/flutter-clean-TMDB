import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutthemovie/features/home/presentation/bloc/movie_list_cubit/movie_list_cubit.dart';

import '../atom/movie_dropdown.dart';

class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomePageAppBar() : super(key: const Key('HomePageAppBar'));

  @override
  Widget build(BuildContext context) {
    final movieCubit = context.read<MovieListCubit>();
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'FW-Movie',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: MovieDropDown(
              onSelect: (MovieType? value) {
                if (value == MovieType.popular) {
                  movieCubit.getPopMovie();
                } else {
                  movieCubit.getShowingMovie();
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
