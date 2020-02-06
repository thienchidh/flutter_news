import 'dart:collection';

import 'package:flutter_news/model/news_model.dart';
import 'package:meta/meta.dart';

@immutable
class NewsPageModel {
  final String title;
  final UnmodifiableListView<NewsModel> listNewsModel;
  final bool isReachedItem;

  NewsPageModel({
    @required this.title,
    @required this.listNewsModel,
    this.isReachedItem = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsPageModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          listNewsModel == other.listNewsModel &&
          isReachedItem == other.isReachedItem;

  @override
  int get hashCode =>
      title.hashCode ^ listNewsModel.hashCode ^ isReachedItem.hashCode;
}
