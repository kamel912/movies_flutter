import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: "poster_path")
  final String posterPath;

  @JsonKey(
    name: "adult",
    nullable: true,
  )
  final bool adult;

  @JsonKey(
    name: "overview",
    nullable: true,
  )
  final String overview;

  @JsonKey(
    name: "release_date",
    nullable: true,
  )
  final String releaseDate;

  @JsonKey(
    name: "genre_ids",
    nullable: true,
  )
  final List<int> genreIds;

  @JsonKey(
    name: "id",
    nullable: true,
  )
  final int id;

  @JsonKey(
    name: "original_title",
    nullable: true,
  )
  final String originalTitle;

  @JsonKey(
    name: "original_language",
    nullable: true,
  )
  final String originalLanguage;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(
    name: "backdrop_path",
    nullable: true,
  )
  final String backdropPath;

  @JsonKey(
    name: "popularity",
    nullable: true,
  )
  final double popularity;

  @JsonKey(
    name: "vote_count",
    nullable: true,
  )
  final int voteCount;

  @JsonKey(
    name: "video",
    nullable: true,
  )
  final bool video;

  @JsonKey(
    name: "vote_average",
    nullable: true,
  )
  final double voteAverage;

  Movie({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
