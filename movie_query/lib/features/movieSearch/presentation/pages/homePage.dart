import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_query/core/api/datamodels.dart';
import 'package:movie_query/features/movieSearch/data/adapaterUIandrepositry.dart';
import 'package:movie_query/features/movieSearch/presentation/bloc/queryBloc.dart';
import 'package:movie_query/features/movieSearch/presentation/widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  final _queryBloc = QueryBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            SearchBar(),
            StreamBuilder<ApiResponse<List<Movie>>>(
              stream: _queryBloc.responseStream,
              builder: (BuildContext context,
                  AsyncSnapshot<ApiResponse<List<Movie>>> snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data.status) {
                    case Status.EMPTYSTRING:
                      return Container(
                        child: Text("Empty String !!!"),
                      );
                      break;
                    case Status.LOADING:
                      return Loading(
                        loadingMessage: snapshot.data.message,
                      );
                      break;
                    case Status.COMPLETED:
                      return MovieListView(movieList: snapshot.data.data);
                      break;
                    case Status.ERROR:
                      return Center(
                        child: Text(
                            "There is an Error ${snapshot.data.toString()}"),
                      );
                      break;
                    case Status.NORESFOUND:
                      return Container(child: Text("No Results Found"));
                      break;
                  }
                }
                return Center(
                  child: Text("Please Start Searching."),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
