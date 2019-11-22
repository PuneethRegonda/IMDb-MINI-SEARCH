import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_query/common/textTheam.dart';
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
                            child: Text("Empty String !!!",style: textstyle,),
                          ),
                        );
                        break;
                      case Status.LOADING:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case Status.COMPLETED:
                        return Center(child: MovieListView(movieList: snapshot.data.data));
                        break;
                      case Status.ERROR:
                        return Center(
                          child: Text(snapshot.data.message.toString(),style: textstyle,),
                        );
                        break;
                    }
                  }
                  return Center(
                    child: Text("Please Start Searching.",style: textstyle,),
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


