import 'package:flutter_news/model/my_response/my_response.dart';
import 'package:flutter_news/model/news_model/news_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable(nullable: false)
class NewsResponse extends MyResponse<NewsModel> {
  NewsResponse(List<NewsModel> data, int nextIndex) : super(data, nextIndex);

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return _$NewsResponseFromJson(json);
  }

  static NewsResponse fromJsonInStatic(Map<String, dynamic> json) {
    return NewsResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NewsResponseToJson(this);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is NewsResponse &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
