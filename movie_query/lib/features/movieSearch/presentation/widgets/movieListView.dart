import 'package:flutter/material.dart';
import 'package:movie_query/core/api/datamodels.dart';
import 'package:movie_query/features/movieSearch/presentation/widgets/movieCard.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList;

  const MovieListView({Key key, this.movieList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 70/100,
                  crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              itemCount: movieList.length,
              itemBuilder: (context, int index) => Container(
                child: MovieCard(
                  indexnumberforHero: index,
                  movie: movieList[index],
                  posterUrl: movieList[index].posterUrl,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
