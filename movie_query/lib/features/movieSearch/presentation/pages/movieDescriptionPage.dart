import 'package:flutter/material.dart';
import 'package:movie_query/common/textTheam.dart';
import 'package:movie_query/core/api/datamodels.dart';

class MovieDescription extends StatelessWidget {
  final Movie movie;
  final int indexnumberforHero;

  const MovieDescription({Key key, this.movie, this.indexnumberforHero})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: new Material(
        color: Colors.transparent,
        child: new CustomScrollView(
          slivers: [
            new SliverAppBar(
              flexibleSpace: new FlexibleSpaceBar(
                background: new Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: movie.imdbID + indexnumberforHero.toString(),
                        child: Image.network(
                          movie.posterUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              pinned: false,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              expandedHeight: MediaQuery.of(context).size.height / 2.5,
              backgroundColor: Colors.white,
            ),
            SliverFillRemaining(
              child: Container(
                color: Color(0xeFF2a2a2e),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Text(
                          movie.title,
                          style: textstyle.copyWith(fontSize: 25.0),
                        ),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
