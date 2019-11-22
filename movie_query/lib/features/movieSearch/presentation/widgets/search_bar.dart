import 'package:flutter/material.dart';
import 'package:movie_query/features/movieSearch/presentation/bloc/myBloc.dart';
import 'package:movie_query/features/movieSearch/presentation/bloc/queryBloc.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key key,
  }) : super(key: key);

  final MovieSearchBloc _bloc = MovieSearchBloc();
  final _queryBloc = QueryBloc();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 60.0,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onChanged: (String value) {
                            _bloc.searchEventSink.add(value);
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: " Search Movie by Title ",
                            hintStyle: TextStyle(
                                color: Colors.red[100],
                                fontWeight: FontWeight.w300,
                                fontSize: 16.0,
                                fontStyle: FontStyle.italic)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            // print("Pressed");
                            _queryBloc.streamSetToListen(_bloc.moveName);
                          },
                          icon: Icon(Icons.search),
                          color: Colors.blue[200],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        ),
      ],
    );
  }
}
