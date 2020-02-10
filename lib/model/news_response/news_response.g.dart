// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return NewsResponse(
    (json['data'] as List)
        .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['nextIndex'] as int,
  );
}

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'nextIndex': instance.nextIndex,
    };
