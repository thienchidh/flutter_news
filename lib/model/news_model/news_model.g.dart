// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    title: json['title'] as String,
    image: json['image'] as String,
    country: json['country'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'country': instance.country,
      'timestamp': instance.timestamp,
    };
