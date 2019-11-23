import 'dart:async';

import '../../repository/resultMovieRepo.dart';

class MovieSearchBloc {
  static String _movienametyped = "";

  String get moveName => _movienametyped;

  SearchedMovieRepository movieRepository;

  final _searchStreamController = StreamController<String>();

  StreamSink<String> get searchStreamsink => _searchStreamController.sink;

  Stream<String> get searchStream => _searchStreamController.stream;

  final _searchEventController = StreamController<String>();

  Sink<String> get searchEventSink => _searchEventController.sink;

  MovieSearchBloc() {
    _searchEventController.stream.listen(onData);
  }

  onData(String typedString) {
    _movienametyped = typedString;
    searchStreamsink.add(_movienametyped);
    print(_movienametyped);
    if (_movienametyped.isEmpty) print("String is empty");
  }

  void dispose() {
    _searchEventController.close();
    _searchStreamController.close();
    // _responseStreamController.close();
  }
}
