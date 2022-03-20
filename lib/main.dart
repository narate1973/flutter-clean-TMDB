import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nutthemovie/my_app/presentation/bloc/app_cubit/app_cubit.dart';
import 'package:nutthemovie/my_app/presentation/view/my_app.dart';

void main() async {
  await MyApp.setUpApp();
  runApplication();
}

void runApplication() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I<AppCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}
