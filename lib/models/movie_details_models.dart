
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_models.g.dart';

@JsonSerializable()
class Trailer{
  final String id;
  final String iso6391;
  final String iso31661;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;

  Trailer({this.id, this.iso6391, this.iso31661, this.key, this.name, this.site,
      this.size, this.type});

  factory Trailer.fromJson(Map<String, dynamic> json) => _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);

}


@JsonSerializable()
class Review{
  @JsonKey(name: "author")
  final String author;

  @JsonKey(name: "content")
  final String content;

  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "url")
  final String url;

  Review({this.author, this.content, this.id, this.url});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

}