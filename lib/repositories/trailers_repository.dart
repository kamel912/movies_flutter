import "package:inject/inject.dart";
import 'package:movies_flutter/api/connection.dart';
import 'package:movies_flutter/models/movie_details_models.dart';
import 'package:movies_flutter/models/response.dart';

class TrailersRepository {
  final ApiProvider apiProvider;

  @provide
  @singleton
  TrailersRepository(this.apiProvider);

  Future<BaseResponse<Trailer>> getTrailers(int movieId) =>
      apiProvider.getTrailers(movieId);
}
