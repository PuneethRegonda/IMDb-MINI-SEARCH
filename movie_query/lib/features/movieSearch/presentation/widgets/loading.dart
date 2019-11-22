import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(),
          Text("$loadingMessage"),
         ],
      ),
    );
  }
}
