import 'package:inject/inject.dart';
import 'package:movies_flutter/models/movie_details_models.dart';
import 'package:movies_flutter/models/response.dart';
import 'package:movies_flutter/repositories/movie_details_repositories.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc {
  final TrailersRepository _trailersRepository;
  final ReviewsRepository _reviewsRepository;
  final _movieId = PublishSubject<int>();
  final _trailers = BehaviorSubject<BaseResponse<Trailer>>();
  final _reviews = BehaviorSubject<BaseResponse<Review>>();

  Function(int) get getTrailersById => _movieId.sink.add;

  Observable<BaseResponse<Trailer>> get movieTrailers => _trailers.stream;
  Observable<BaseResponse<Review>> get movieReviews => _reviews.stream;

  @provide
  MovieDetailsBloc(this._trailersRepository, this._reviewsRepository) {
    _movieId.stream.transform(_trailerTransformer()).pipe(_trailers);
    _movieId.stream.transform(_reviewTransformer()).pipe(_reviews);
  }

  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
    _reviews.close();
  }

  _trailerTransformer() {
    return ScanStreamTransformer(
      (Future<BaseResponse<Trailer>> trailers, int id, int index) {
        print(index);
        trailers = _trailersRepository.getTrailers(id);
        return trailers;
      },
    );
  }
  _reviewTransformer() {
    return ScanStreamTransformer(
      (Future<BaseResponse<Review>> trailers, int id, int index) {
        print(index);
        trailers = _reviewsRepository.getReviews(id);
        return trailers;
      },
    );
  }
}
