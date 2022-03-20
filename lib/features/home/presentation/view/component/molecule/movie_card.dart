import 'package:nutthemovie/features/home/presentation/view/component/atom/rating_holder.dart';
import 'package:nutthemovie/features/home/presentation/view/page/movie_detail_page.dart';

import '../../../../../../core/core.dart';
import '../../../../domain/entity/movie_list_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movieEntity;

  const MovieCard({Key? key, required this.movieEntity}) : super(key: key);

  void _onNavigation(BuildContext context) => Navigator.of(context).push(
        AppPageRoute(MovieDetailPage.create(movieEntity: movieEntity)),
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onNavigation(context),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            AppNetWorkImage.rect(
              movieEntity.thumbnailURL,
              width: 70,
              height: 110,
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingHolder(rating: movieEntity.rating),
                    const SizedBox(height: 2),
                    Text(
                      movieEntity.title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      movieEntity.genres,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
