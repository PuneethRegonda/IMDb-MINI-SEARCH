import 'package:flutter/material.dart';
import 'package:movie_query/core/api/datamodels.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList;

  const MovieListView({Key key, this.movieList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: movieList.length,
        itemBuilder: (context, int index) => Card(
          child: Text(movieList[index].title),
        ),
      ),
    );
  }
}
