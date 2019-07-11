// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trailer _$TrailerFromJson(Map<String, dynamic> json) {
  return Trailer(
      id: json['id'] as String,
      iso6391: json['iso6391'] as String,
      iso31661: json['iso31661'] as String,
      key: json['key'] as String,
      name: json['name'] as String,
      site: json['site'] as String,
      size: json['size'] as int,
      type: json['type'] as String);
}

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'id': instance.id,
      'iso6391': instance.iso6391,
      'iso31661': instance.iso31661,
      'key': instance.key,
      'name': instance.name,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type
    };

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return Review(
      author: json['author'] as String,
      content: json['content'] as String,
      id: json['id'] as String,
      url: json['url'] as String);
}

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'id': instance.id,
      'url': instance.url
    };
