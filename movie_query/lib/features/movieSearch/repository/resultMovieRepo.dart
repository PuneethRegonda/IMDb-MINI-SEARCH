import 'package:movie_query/core/api/apiCredentials.dart';
import 'package:movie_query/core/api/datamodels.dart';
import 'package:movie_query/core/api/exceptions.dart';

class SearchedMovieRepository {
  Future<List<Movie>> fetchMoviesList() async {
    var json = await Api.getMovies();
      print("json is $json");
      if (json["Error"] != null) {
        if (json["Error"].toString().contains("Moview not found"))
          throw MoviewNotFoundException("Error: Movie Not Found!!");
        else if (json["Error"].toString().contains("Too many results"))
          throw TooManyResults("Error: Too many results!!");
      }
      var list = ApiResponseModel.fromJson(json).searchResults;
      return list;
  }
}
