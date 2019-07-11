import "package:inject/inject.dart";
import 'package:movies_flutter/api/connection.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/models/response.dart';

class MoviesRepository  implements _MoviesRepository{
  final ApiProvider apiProvider;

  @provide
  @singleton
  MoviesRepository(this.apiProvider);

  @override
  Future<BaseResponse<Movie>> getMovies(String type) =>
      apiProvider.getMovies(type);
}

abstract class _MoviesRepository{
  Future<BaseResponse<Movie>> getMovies(String type);
}