import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_query/common/textTheam.dart';
import 'package:movie_query/core/core.dart';
import 'package:movie_query/features/movieSearch/data/adapaterUIandrepositry.dart';
import 'package:movie_query/features/movieSearch/presentation/bloc/queryBloc.dart';
import 'package:movie_query/features/movieSearch/presentation/widgets/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final _queryBloc = QueryBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Align(alignment: Alignment.topRight, child: SearchBar()),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: StreamBuilder<ApiResponse<List<Movie>>>(
                stream: _queryBloc.responseStream,
                builder: (BuildContext context,
                    AsyncSnapshot<ApiResponse<List<Movie>>> snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data.status) {
                      case Status.EMPTYSTRING:
                        return Center(
                          child: Container(
                            child: Text(
                              "Empty String !!!",
                              style: textstyle,
                            ),
                          ),
                        );
                        break;
                      case Status.LOADING:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case Status.COMPLETED:
                        return Center(
                            child:
                                MovieListView(movieList: snapshot.data.data));
                        break;
                      case Status.ERROR:
                        return Center(
                          child: Text(
                            snapshot.data.message.toString(),
                            style: textstyle,
                          ),
                        );
                        break;
                    }
                  }
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: "IMDB-Mini Search",
                              children: [
                                TextSpan(
                                  text: "©",
                                  style: textstyle.copyWith(fontSize: 10.0),
                                )
                              ],
                              style: textstyle.copyWith(fontSize: 40.0)),
                        ),
                        Text(
                          "A Flutter Powered application that enables users to get any Media content like Movies, Web Series, Anime ",
                          textAlign: TextAlign.center,
                          style: textstyle.copyWith(fontSize: 13.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: InkWell(
                            onTap: () {
                              var dev = Developer();
                              launch("mailto: ${dev.mail}");
                            },
                            child: RichText(
                              text: TextSpan(
                                  text: "Developer: ",
                                  style: textstyle.copyWith(
                                    fontSize: 15.0,
                                    color: Colors.green[400],
                                  ),
                                  children: [
                                    TextSpan(text: " Puneeth Regonda"),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
