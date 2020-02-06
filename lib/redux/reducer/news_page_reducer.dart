import 'dart:math';

import 'package:flutter_news/redux/action/action_news.dart';
import 'package:flutter_news/redux/state/news_page_state.dart';
import 'package:redux/redux.dart';

final newsPageReducer = combineReducers<NewsPageState>([
  // TODO
  TypedReducer<NewsPageState, ActionNewsLoadMore>(_loadMoreNewsReducer),
  TypedReducer<NewsPageState, ActionNewsLoadMoreSuccess>(
      _loadMoreNewsSuccessReducer),
  TypedReducer<NewsPageState, ActionNewsLoadMoreError>(
      _loadMoreNewsErrorReducer),
]);

NewsPageState _loadMoreNewsReducer(
    NewsPageState state, ActionNewsLoadMore action) {
  return state.copyOf(
    isLoading: true,
    isError: false,
    error: null,
  );
}

NewsPageState _loadMoreNewsSuccessReducer(
    NewsPageState state, ActionNewsLoadMoreSuccess action) {
  return state.copyOf(
    isLoading: false,
    model: action.data,
    isError: false,
    error: null,
  );
}

NewsPageState _loadMoreNewsErrorReducer(
    NewsPageState state, ActionNewsLoadMoreError action) {
  return state.copyOf(
    isLoading: false,
    isError: true,
    error: action.error,
  );
}
