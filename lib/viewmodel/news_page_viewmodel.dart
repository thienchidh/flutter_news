import 'dart:ui';

import 'package:flutter_news/model/news_page_model.dart';
import 'package:flutter_news/redux/action/action_news.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class NewsPageViewModel {
  final String title;
  final NewsPageModel model;
  final bool isLoading;
  final bool isError;
  final bool isReachedItem;
  final Error error;

  final VoidCallback loadMore;

  NewsPageViewModel({
    @required this.model,
    @required this.loadMore,
    @required this.isLoading,
    @required this.isError,
    @required this.error,
    @required this.isReachedItem,
    @required this.title,
  });

  static NewsPageViewModel fromStore(Store<AppState> store) {
    final state = store.state.newsPageState;
    final model = state.model;
    return NewsPageViewModel(
      model: model,
      loadMore: () {
        if (state.isLoading) {
          return;
        }
        store.dispatch(ActionNewsLoadMore(model));
      },
      isLoading: state.isLoading,
      isError: state.isError,
      error: state.error,
      isReachedItem: state.model.isReachedItem,
      title: model.title,
    );
  }
}
