class ApiException implements Exception {
  final message;

  ApiException([this.message]);

  String toString() {
    return "$message";
  }
}

///Types of Exceptions
///  Exception at Data Fetching
///  To many Results
///  No results found


class FetchDataException extends ApiException {
  FetchDataException([message]) : super(message);
}

class TooManyResults extends ApiException {
  TooManyResults([message]) : super(message);
}

class MovieNotFoundException extends ApiException {
  MovieNotFoundException([message]) : super(message, );
}
