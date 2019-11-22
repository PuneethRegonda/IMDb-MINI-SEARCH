import 'package:flutter/material.dart';

import 'features/movieSearch/presentation/pages/homePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MovieQuery',
        home: Scaffold(body: HomeScreen()));
  }
}


// new List<int>.generate(10, (i) => i + 1)
//
