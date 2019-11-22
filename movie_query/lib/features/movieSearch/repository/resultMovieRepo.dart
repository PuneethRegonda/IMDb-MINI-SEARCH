
import 'package:movie_query/core/core.dart';

class SearchedMovieRepository {
  Future<List<Movie>> fetchMoviesList() async {
    var json = await Api.getMovies();
    print("json is $json");
    if (json["Error"] != null) {
      if (json["Error"].toString().contains("Movie not found!"))
        throw MovieNotFoundException("Movie Not Found!!");
      else if (json["Error"].toString().contains("Too many results"))
        throw TooManyResults("Too many results!!");
      else
        throw ApiException("UnKnow Error: ${json["Error"]}");
    } else {
      var list = ApiResponseModel.fromJson(json).searchResults;
      return list;
    }
  }
}
