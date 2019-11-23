import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/textTheam.dart';
import '../../../../core/core.dart';

class MovieDescription extends StatelessWidget {
  final Movie movie;
  final int indexnumberforHero;

  const MovieDescription({Key key, this.movie, this.indexnumberforHero})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        child: new Material(
          color: Colors.transparent,
          child: new CustomScrollView(
            slivers: [
              new SliverAppBar(
                centerTitle: true,
                title: Text(
                  movie.title,
                  style: textstyle.copyWith(fontSize: 30.0),
                ),
                flexibleSpace: new FlexibleSpaceBar(
                  background: new Stack(
                    children: [
                      Positioned.fill(
                        child: Hero(
                          tag: movie.imdbID + indexnumberforHero.toString(),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                movie.posterUrl,
                              ),
                            )),
                            child: new BackdropFilter(
                              filter: new ImageFilter.blur(
                                  sigmaX: 10.0, sigmaY: 10.0),
                              child: new Container(
                                decoration: new BoxDecoration(
                                    color: Colors.white.withOpacity(0.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
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
                expandedHeight: MediaQuery.of(context).size.height / 3.0,
                backgroundColor: Colors.white,
              ),
              SliverFillRemaining(
                child: Container(
                  color: Color(0xeFF2a2a2e),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              movie.posterUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "\nType: ${movie.type}",
                              style: textstyle,
                            ),
                            Text("\nYear: ${movie.year}", style: textstyle),
                            movie.posterUrl.contains("N/A")
                                ? Container()
                                : InkWell(
                                    onTap: () {
                                      launch("${movie.posterUrl}");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("\nGet the Poster here",
                                          style: textstyle.copyWith(
                                              color: Colors.green)),
                                    )),
                          ],
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
