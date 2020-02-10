import 'package:flutter_news/model/news_model/news_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'news_detail_model.g.dart';

@JsonSerializable(nullable: false)
@immutable
class NewsDetailModel extends NewsModel {
  // TODO
  NewsDetailModel({title, linkImage, timestamp, country})
      : super(
            title: title,
            linkImage: linkImage,
            timestamp: timestamp,
            country: country);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is NewsDetailModel &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) {
    return _$NewsDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NewsDetailModelToJson(this);
  }
}
