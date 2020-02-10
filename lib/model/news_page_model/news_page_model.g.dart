// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsPageModel _$NewsPageModelFromJson(Map<String, dynamic> json) {
  return NewsPageModel(
    data: (json['data'] as List)
        .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    isReachedItem: json['isReachedItem'] as bool,
    nextIndex: json['nextIndex'] as int,
  );
}

Map<String, dynamic> _$NewsPageModelToJson(NewsPageModel instance) =>
    <String, dynamic>{
      'nextIndex': instance.nextIndex,
      'isReachedItem': instance.isReachedItem,
      'data': instance.data,
    };
