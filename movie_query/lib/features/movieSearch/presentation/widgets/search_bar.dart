import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../common/textTheam.dart';
import '../bloc/myBloc.dart';
import '../bloc/queryBloc.dart';

class SearchBar extends StatefulWidget {
  SearchBar({
    Key key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool selected = false;

  final MovieSearchBloc _bloc = MovieSearchBloc();
  final _queryBloc = QueryBloc();

  void onSearchTap() {
    FocusScope.of(context).requestFocus(FocusNode());
    if (selected) {
      _queryBloc.streamSetToListen(_bloc.moveName);
    }
    setState(() {
      selected = !selected;
    });
  }

  void clearLastText() {
    Future.delayed(Duration(milliseconds: 50)).then((_){ textFieldcontroller.clear();}).then((_){
    _bloc.cleartheText();
    });
  }

  final TextEditingController textFieldcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 60.0,
            child: Card(
              color: Color(0xFF38383d),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    AnimatedContainer(
                      width: selected
                          ? MediaQuery.of(context).size.width * 75 / 100
                          : 0.09,
                      height: 60.0,
                      alignment:
                          selected ? Alignment.center : Alignment.topRight,
                      curve: Curves.easeInOut,
                      child: TextFormField(
                        controller: textFieldcontroller,
                        style: textstyle,
                        onChanged: (String value) {
                          _bloc.searchEventSink.add(value.trim());
                        },
                        onFieldSubmitted: (_) => onSearchTap(),
                        decoration: InputDecoration(
                            suffixIcon: selected?IconButton(
                              iconSize: 18.0,
                              color: Colors.white,
                              onPressed: () {
                                clearLastText();
                              },
                              icon: Icon(Icons.close,),
                            ):Container(),
                            border: InputBorder.none,
                            hintText: " Search Movie by Title ",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0,
                                fontStyle: FontStyle.normal)),
                      ),
                      duration: const Duration(milliseconds: 250),
                    ),
                    IconButton(
                      onPressed: () => onSearchTap(),
                      icon: Icon(Icons.search),
                      color: selected ? Colors.blue[200] : Colors.grey,
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        ],
      ),
    );
  }
}
