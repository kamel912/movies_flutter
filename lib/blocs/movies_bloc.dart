import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/models/response.dart';
import 'package:movies_flutter/repositories/movies_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:inject/inject.dart';

List<PublishSubject<BaseResponse<Movie>>> _moviesFetcher;

class MoviesBloc {
  final MoviesRepository _moviesRepository;

  final _types = [
    "popular",
    "top_rated",
    "upcoming",
    "now_playing",
  ];

  @provide
  @singleton
  MoviesBloc(
    this._moviesRepository,
  ) {
    _moviesFetcher = [
      PublishSubject<BaseResponse<Movie>>(),
      PublishSubject<BaseResponse<Movie>>(),
      PublishSubject<BaseResponse<Movie>>(),
      PublishSubject<BaseResponse<Movie>>(),
    ];
  }

  _getMovies(String type, PublishSubject<BaseResponse<Movie>> fetcher) async {
    BaseResponse<Movie> baseResponse = await _moviesRepository.getMovies(type);
    fetcher.sink.add(baseResponse);
  }

  getMovies() {
    for (int i = 0; i < _types.length; i++) {
      _getMovies(_types[i], _moviesFetcher[i]);
    }
  }

  dispose() {
    for (var fetcher in _moviesFetcher) {
      fetcher.close();
    }
  }

  Observable<List<BaseResponse<Movie>>> get stream => Observable.zip4(
        _moviesFetcher[0].stream,
        _moviesFetcher[1].stream,
        _moviesFetcher[2].stream,
        _moviesFetcher[3].stream,
        (a, b, c, d) {
          return List.from([a, b, c, d]);
        },
      );
}
