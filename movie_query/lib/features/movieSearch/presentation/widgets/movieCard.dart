import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_query/common/textTheam.dart';
import 'package:movie_query/core/api/datamodels.dart';
import 'package:movie_query/features/movieSearch/presentation/pages/movieDescriptionPage.dart';

class MovieCard extends StatelessWidget {
  final String posterUrl;
  final Movie movie;
  final int indexnumberforHero;
  MovieCard({Key key, this.posterUrl, this.movie, this.indexnumberforHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(0xFF38383d),
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => MovieDescription(movie: movie,indexnumberforHero:indexnumberforHero)));
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(color: Colors.red[100]),
          child: posterUrl.contains("N/A")
              ? AspectRatio(
                  aspectRatio: 70 / 100,
                  child: Container(
                    child: Center(child: Text("Poster not Avaliable",style: textstyle.copyWith(color: Colors.grey),)),
                    color: Colors.grey[200],
                  ),
                )
              : Hero(
                  tag: movie.imdbID+indexnumberforHero.toString(),
                  child: Image.network(
                    posterUrl,
                    fit: BoxFit.fill,
                  ),
                ),
        ),
      ),
    );
  }
}
