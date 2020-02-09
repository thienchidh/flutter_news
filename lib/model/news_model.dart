import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable(nullable: false)
@immutable
class NewsModel {
  final String title;
  final String linkImage;
  final String country;
  final int timestamp;

  NewsModel({
    @required this.title,
    @required this.linkImage,
    @required this.country,
    @required this.timestamp,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          linkImage == other.linkImage &&
          country == other.country &&
          timestamp == other.timestamp;

  @override
  int get hashCode =>
      title.hashCode ^
      linkImage.hashCode ^
      country.hashCode ^
      timestamp.hashCode;
}
