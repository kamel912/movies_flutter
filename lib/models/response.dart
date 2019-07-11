import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';
import 'movie_details_models.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse<T> {
  @JsonKey(name: 'page')
  final int page;

  @JsonKey(name: 'total_results')
  final int totalResults;

  @JsonKey(name: 'total_pages')
  final int totalPages;

  @JsonKey(name: 'results')
  @_Converter()
  final List<T> results;

  BaseResponse(
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  );

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic> && T == Movie) {
      return Movie.fromJson(json) as T;
    } else if (json is Map<String, dynamic> && T == Trailer) {
      return Trailer.fromJson(json) as T;
    } else if (json is Map<String, dynamic> && T == Review) {
      return Review.fromJson(json) as T;
    }

    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    return json as T;
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}
