// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailModel _$NewsDetailModelFromJson(Map<String, dynamic> json) {
  return NewsDetailModel(
    title: json['title'],
    linkImage: json['linkImage'],
    timestamp: json['timestamp'],
    country: json['country'],
  );
}

Map<String, dynamic> _$NewsDetailModelToJson(NewsDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'linkImage': instance.linkImage,
      'country': instance.country,
      'timestamp': instance.timestamp,
    };
