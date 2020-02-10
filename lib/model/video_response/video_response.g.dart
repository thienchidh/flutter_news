// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) {
  return VideoResponse(
    (json['data'] as List)
        .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['nextIndex'] as int,
  );
}

Map<String, dynamic> _$VideoResponseToJson(VideoResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'nextIndex': instance.nextIndex,
    };
