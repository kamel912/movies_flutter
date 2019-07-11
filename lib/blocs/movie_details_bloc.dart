import 'package:inject/inject.dart';
import 'package:movies_flutter/models/movie_details_models.dart';
import 'package:movies_flutter/models/response.dart';
import 'package:movies_flutter/repositories/trailers_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailBloc {
  final TrailersRepository _trailersRepository;
  final _movieId = PublishSubject<int>();
  final _trailers = BehaviorSubject<BaseResponse<Trailer>>();

  Function(int) get getTrailersById => _movieId.sink.add;

  Observable<BaseResponse<Trailer>> get movieTrailers => _trailers.stream;

  @provide
  MovieDetailBloc(this._trailersRepository) {
    _movieId.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemTransformer() {
    return ScanStreamTransformer(
      (Future<BaseResponse<Trailer>> trailers, int id, int index) {
        print(index);
        trailers = _trailersRepository.getTrailers(id);
        return trailers;
      },
    );
  }
}
