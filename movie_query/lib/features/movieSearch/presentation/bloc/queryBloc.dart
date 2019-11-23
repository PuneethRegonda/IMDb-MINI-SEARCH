import 'dart:async';

import '../../../../core/core.dart';
import '../../data/adapaterUIandrepositry.dart';
import '../../repository/resultMovieRepo.dart';

class QueryBloc {
  static final StreamController<ApiResponse<List<Movie>>>
      _responsestreamController = StreamController<ApiResponse<List<Movie>>>();

  Sink<ApiResponse<List<Movie>>> get _responseStreamSink =>
      _responsestreamController.sink;
  Stream<ApiResponse<List<Movie>>> get responseStream =>
      _responsestreamController.stream;

  SearchedMovieRepository movieRepository;

  QueryBloc() {
    movieRepository = SearchedMovieRepository();
    // _responsestreamController.stream.listen(streamSetToListen);
  }

  Future streamSetToListen(String typedString) async {
    if (typedString.isNotEmpty) {
      _responseStreamSink.add(ApiResponse.loading("Searching for the Movie"));
      print("resposeStream ");
      try {
        List<Movie> results = await movieRepository.fetchMoviesList();
        print("Results:");
        if (results != null)
          _responseStreamSink.add(ApiResponse.completed(results));
      } catch (e) {
        print("Exception $e");
        _responseStreamSink.add(ApiResponse.error(e.toString()));
      }
    } else {
      print("Empty String");
      _responseStreamSink.add(ApiResponse.notInitialize("Empty String"));
    }
  }

  @override
  void dispose() {
    _responsestreamController.close();
  }
}
