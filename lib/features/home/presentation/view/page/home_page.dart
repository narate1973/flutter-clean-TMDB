import 'package:nutthemovie/features/home/presentation/view/component/organism/home_page_app_bar.dart';
import 'package:nutthemovie/features/home/presentation/view/component/organism/movie_card_list.dart';
import '../../bloc/movie_list_cubit/movie_list_cubit.dart';

import '../../../../../core/core.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage._() : super(key: const Key('MyHomePage'));

  static Widget create() => BlocProvider(
        create: (context) => GetIt.I<MovieListCubit>()..getPopMovie(),
        child: const MyHomePage._(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBar(),
      body: BlocBuilder<MovieListCubit, MovieListState>(
        builder: (context, state) {
          if (state is MovieListSuccess) {
            return MovieCardList(movieList: state.movieList);
          }
          return const AppLoadingScreen();
        },
      ),
    );
  }
}
