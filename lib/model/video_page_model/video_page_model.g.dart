// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoPageModel _$VideoPageModelFromJson(Map<String, dynamic> json) {
  return VideoPageModel(
    data: json['data'],
    isReachedItem: json['isReachedItem'],
    nextIndex: json['nextIndex'],
  );
}

Map<String, dynamic> _$VideoPageModelToJson(VideoPageModel instance) =>
    <String, dynamic>{
      'nextIndex': instance.nextIndex,
      'isReachedItem': instance.isReachedItem,
      'data': instance.data,
    };
