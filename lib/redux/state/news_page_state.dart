import 'dart:collection';

import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/model/news_page_model.dart';
import 'package:meta/meta.dart';

@immutable
class NewsPageState {
  final NewsPageModel model;
  final bool isLoading;
  final bool isError;
  final Error error;

  NewsPageState({
    @required this.model,
    this.isLoading = false,
    this.isError = false,
    this.error,
  });

  NewsPageState copyOf({
    NewsPageModel model,
    bool isLoading,
    bool isError,
    Error error,
  }) {
    return NewsPageState(
      model: model ?? this.model,
      error: error ?? this.error,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  static NewsPageState initialize() {
    return NewsPageState(
      model: NewsPageModel(
        title: "News",
        listNewsModel: UnmodifiableListView<NewsModel>([
          NewsModel(
            title: "1",
            linkImage:
                "https://kenh14cdn.com/zoom/460_289/2020/2/6/avatar-15809653539941703360200-crop-1580965380165995299685.jpg",
            country: "VN",
            timestamp: 123456789,
          ),
          NewsModel(
            title: "2",
            linkImage:
                "https://kenh14cdn.com/zoom/460_289/2020/2/6/avatar-15809653539941703360200-crop-1580965380165995299685.jpg",
            country: "VN",
            timestamp: 123456780009,
          ),
          NewsModel(
            title: "3",
            linkImage:
                "https://kenh14cdn.com/zoom/460_289/2020/2/6/avatar-15809653539941703360200-crop-1580965380165995299685.jpg",
            country: "VN",
            timestamp: 123456789,
          ),
          NewsModel(
            title: "4",
            linkImage:
                "https://kenh14cdn.com/zoom/460_289/2020/2/6/avatar-15809653539941703360200-crop-1580965380165995299685.jpg",
            country: "VN",
            timestamp: 123456789,
          )
        ]),
      ),
    );
  }
}
