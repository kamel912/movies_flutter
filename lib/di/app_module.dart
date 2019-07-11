import 'package:dio/dio.dart';
import 'package:inject/inject.dart';
import 'package:movies_flutter/api/base_urls.dart';

@module
class AppModule {

  @provide
  @singleton
  Dio dio() => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      queryParameters: {
        apiKey: myApiKey,
      },
    ),
  );


}