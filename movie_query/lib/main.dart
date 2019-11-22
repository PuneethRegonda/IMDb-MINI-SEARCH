import 'package:flutter/material.dart';

import 'features/movieSearch/presentation/pages/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: new ThemeData(
          fontFamily: "QuickSand",
          accentColor:Color(0xeFF2a2a2e),
          primaryColor: Color(0xeFF2a2a2e),),
        debugShowCheckedModeBanner: false,
        title: 'MovieQuery',
        home: Scaffold(
          backgroundColor: Color(0xeFF2a2a2e),
          body: HomeScreen()));
  }
}
