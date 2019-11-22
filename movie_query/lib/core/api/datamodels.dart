class ApiResponseModel {
  bool okResponse;
  int recordsFound;
  List<Movie> searchResults = [];

  ApiResponseModel({this.okResponse, this.recordsFound, this.searchResults});

  ApiResponseModel.fromJson(Map<String, dynamic> json) {
    this.okResponse = json['Response'] == 'True' ? true : false;
    this.recordsFound = int.parse(json['totalResults']);
    print("Response ${json['Response']}");
    print("results $recordsFound");
    if (okResponse) {
      try {
        json['Search'].forEach((value) {
          // print("movie parsing ${value["Title"]}");
          this.searchResults.add(Movie.fromJson(value));
        });
        // print("seacrh results $searchResults");
      } catch (e) {
        print("found exception $e");
      }
    }
  }
}

class Movie {
  String title;
  String imdbID;
  String year;
  String posterUrl;
  String type;

  Movie({this.title, this.imdbID, this.year, this.posterUrl, this.type});

  Movie.fromJson(Map<String, dynamic> json) {
    this.title = json['Title'];
    this.imdbID = json['imdbID'];
    this.type = json['Type'];
    this.year = json['Year'];
    this.posterUrl = json['Poster'];
  }
}

////Title	"The Avengers"
// Year	"2012"
// imdbID	"tt0848228"
// Type	"movie"
// Poster	"https://m.media-amazon.c…MxODk2OTU@._V1_SX300.jpg"
