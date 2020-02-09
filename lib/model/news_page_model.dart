import 'dart:collection';

import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/news_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable(nullable: false)
@immutable
class NewsPageModel extends LoadMoreModel<NewsModel> {
  NewsPageModel({
    UnmodifiableListView<NewsModel> data,
    bool isReachedItem = false,
    int nextIndex = 0,
  }) : super(
          isReachedItem: isReachedItem,
          nextIndex: nextIndex,
          data: data ?? UnmodifiableListView<NewsModel>([]),
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is NewsPageModel &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
