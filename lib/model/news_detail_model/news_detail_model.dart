import 'package:flutter_news/model/news_model/news_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'news_detail_model.g.dart';

@JsonSerializable(nullable: false)
@immutable
class NewsDetailModel extends NewsModel {
  // TODO
  final List<String> images;

  NewsDetailModel({
    @required title,
    @required image,
    @required this.images,
    @required timestamp,
    @required country,
  }) : super(
            title: title, image: image, timestamp: timestamp, country: country);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is NewsDetailModel &&
          runtimeType == other.runtimeType &&
          images == other.images;

  @override
  int get hashCode => super.hashCode ^ images.hashCode;

  factory NewsDetailModel.fromJson(Map<String, dynamic> json) {
    return _$NewsDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NewsDetailModelToJson(this);
  }
}
