import 'package:flutter/material.dart';
import 'package:movie_query/common/textTheam.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 60.0,
              child: Card(
                color: Color(0xFF38383d),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          style: textstyle,
                          onChanged: (String value) {
                              _bloc.searchEventSink.add(value);
                          },
                          decoration: InputDecoration(
                              
                              border: InputBorder.none,
                              hintText: " Search Movie by Title ",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.0,
                                  fontStyle: FontStyle.normal)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
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
      ),
    );
  }
}
