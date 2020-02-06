import 'package:meta/meta.dart';

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

  NewsModel.fromJsonMap(Map<String, dynamic> map)
      : title = map["title"],
        linkImage = map["linkImage"],
        country = map["country"],
        timestamp = map["timestamp"];

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['linkImage'] = linkImage;
    data['country'] = country;
    data['timestamp'] = timestamp;
    return data;
  }
}
