import 'package:flutter_news/model/news_model.dart';
import 'package:meta/meta.dart';

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
}