import "package:inject/inject.dart";
import 'package:movies_flutter/api/connection.dart';
import 'package:movies_flutter/models/movie_details_models.dart';
import 'package:movies_flutter/models/response.dart';

class ReviewsRepository {
  final ApiProvider apiProvider;

  @provide
  @singleton
  ReviewsRepository(this.apiProvider);

  Future<BaseResponse<Review>> getReviews(int movieId) =>
      apiProvider.getReviews(movieId);
}
