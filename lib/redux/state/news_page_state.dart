import 'package:flutter_news/model/news_model/news_model.dart';
import 'package:flutter_news/model/news_page_model/news_page_model.dart';
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
  final void Function(double) scrollTo;

  NewsPageState({
    @required this.title,
    @required this.model,
    @required this.backToTop,
    @required this.scrollTo,
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
    void Function(double) scrollTo,
  }) {
    return NewsPageState(
      title: title ?? this.title,
      model: model ?? this.model,
      error: error ?? this.error,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      currentScrollOffset: currentScrollOffset ?? this.currentScrollOffset,
      backToTop: backToTop ?? this.backToTop,
      scrollTo: scrollTo ?? this.scrollTo,
    );
  }

  static NewsPageState initialize() {
    return NewsPageState(
      scrollTo: (_) {},
      backToTop: () {},
      title: "News",
      model: NewsPageModel(
        data: List<NewsModel>.unmodifiable([]),
      ),
    );
  }
}
