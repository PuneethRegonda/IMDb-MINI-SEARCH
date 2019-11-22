class ApiException implements Exception {
  final message;
  final prefix;

  ApiException([this.message, this.prefix]);

  String toString() {
    return "$message" + "$prefix";
  }
}

///Types of Exceptions
///  Exception at Data Fetching
///  To many Results
///  No results found


class FetchDataException extends ApiException {
  FetchDataException([message]) : super([message,"No Internet:"]);
}

class TooManyResults extends ApiException {
  TooManyResults([message]) : super(message, "Too Many Results:");
}

class MoviewNotFoundException extends ApiException {
  MoviewNotFoundException([message]) : super(message, "No Results Found:");
}
