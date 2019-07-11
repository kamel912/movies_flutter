import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import 'package:movies_flutter/models/movie.dart';
import 'package:movies_flutter/models/movie_details_models.dart';
import 'package:movies_flutter/models/response.dart';


class ApiProvider {
  final Dio _dio;

  @provide
  ApiProvider(this._dio);


  Future<BaseResponse<Movie>> getMovies(String type) async {
    Response response = await _dio.get('movie/$type');
    if(response.statusCode != 200){
      return throw Exception('');
    }
    return BaseResponse<Movie>.fromJson(response.data);
  }

  Future<Movie> getMovie(int id) async {
    Response response = await _dio.get('movie/$id');
    return Movie.fromJson(response.data);
  }

  Future<BaseResponse<Trailer>> getTrailers(int id) async {
    Response response = await _dio.get('movie/$id/videos');
    return BaseResponse<Trailer>.fromJson(response.data);
  }

  Future<BaseResponse<Review>> getReviews(int id) async {
    Response response = await _dio.get('movie/$id/reviews');
    return BaseResponse<Review>.fromJson(response.data);
  }


}
