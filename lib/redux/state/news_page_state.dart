import 'dart:collection';

import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/model/news_page_model.dart';
import 'package:meta/meta.dart';

@immutable
class NewsPageState {
  final String title;
  final NewsPageModel model;
  final bool isLoading;
  final bool isError;
  final Error error;
  final double currentScrollOffset;
  final void Function() backToTop;

  NewsPageState({
    @required this.title,
    @required this.model,
    @required this.backToTop,
    this.isLoading = false,
    this.isError = false,
    this.error,
    this.currentScrollOffset = 0,
  });

  NewsPageState copyOf({
    String title,
    NewsPageModel model,
    bool isLoading,
    bool isError,
    Error error,
    double currentScrollOffset,
    void Function() backToTop,
  }) {
    return NewsPageState(
        title: title ?? this.title,
        model: model ?? this.model,
        error: error ?? this.error,
        isError: isError ?? this.isError,
        isLoading: isLoading ?? this.isLoading,
        currentScrollOffset: currentScrollOffset ?? this.currentScrollOffset,
        backToTop: backToTop ?? this.backToTop);
  }

  static NewsPageState initialize() {
    return NewsPageState(
      backToTop: () {},
      title: "News",
      model: NewsPageModel(
        data: UnmodifiableListView<NewsModel>([
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
