import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'news_model.g.dart';

@JsonSerializable(nullable: false)
@immutable
class NewsModel {
  final String title;
  final String image;
  final String country;
  final int timestamp;

  NewsModel({
    @required this.title,
    @required this.image,
    @required this.country,
    @required this.timestamp,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is NewsModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          image == other.image &&
          country == other.country &&
          timestamp == other.timestamp;

  @override
  int get hashCode =>
      title.hashCode ^ image.hashCode ^ country.hashCode ^ timestamp.hashCode;

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return _$NewsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NewsModelToJson(this);
  }
}
