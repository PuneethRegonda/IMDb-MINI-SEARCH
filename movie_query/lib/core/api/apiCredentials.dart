import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movie_query/features/movieSearch/presentation/bloc/myBloc.dart';

import 'exceptions.dart';

class Api {
  static final String _endPoint = "http://www.omdbapi.com/?s=";

  static String get url => _endPoint;

  static String mapSearchUrl(String queryWord) {
    return url + "$queryWord&apikey=7d60bef5";
  }

  static Future<dynamic> getMovies() async {
    var movieName = MovieSearchBloc().moveName;
    print("$movieName movie");
    String url = mapSearchUrl(movieName);
    var jsonResponse;
    try {
      print("url is $url");
      http.Response response = await http.get(url);
      jsonResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("NO INTERNET CONNECTION");
    }
    return jsonResponse;
  }

  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());

        return responseJson;
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

// http://www.omdbapi.com/?s=Avengers&apikey=7d60bef5
// Api({this.endPoint, this.accessKey});
