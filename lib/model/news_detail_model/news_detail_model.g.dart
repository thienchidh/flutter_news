// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailModel _$NewsDetailModelFromJson(Map<String, dynamic> json) {
  return NewsDetailModel(
    title: json['title'],
    image: json['image'],
    images: (json['images'] as List).map((e) => e as String).toList(),
    timestamp: json['timestamp'],
    country: json['country'],
  );
}

Map<String, dynamic> _$NewsDetailModelToJson(NewsDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'country': instance.country,
      'timestamp': instance.timestamp,
      'images': instance.images,
    };
