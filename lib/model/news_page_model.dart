import 'dart:collection';

import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/news_model.dart';
import 'package:meta/meta.dart';

@immutable
class NewsPageModel extends LoadMoreModel {
  final String title;
  final UnmodifiableListView<NewsModel> listNewsModel;

  NewsPageModel({
    @required this.title,
    @required this.listNewsModel,
    isReachedItem = false,
    nextIndex = 0,
  }) : super(isReachedItem: isReachedItem, nextIndex: nextIndex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is NewsPageModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          listNewsModel == other.listNewsModel;

  @override
  int get hashCode => super.hashCode ^ title.hashCode ^ listNewsModel.hashCode;
}
