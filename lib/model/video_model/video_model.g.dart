// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) {
  return VideoModel(
    title: json['title'] as String,
    image: json['image'] as String,
    linkVideo: json['linkVideo'] as String,
  );
}

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'linkVideo': instance.linkVideo,
    };
