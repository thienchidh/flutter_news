import 'dart:collection';

import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/model/news_page_model.dart';
import 'package:flutter_news/redux/action/action_news.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/repository/news_repository.dart';
import 'package:flutter_news/viewmodel/news_page_viewmodel.dart';
import 'package:redux/redux.dart';

final List<Middleware<AppState>> newsMiddleware = [
  TypedMiddleware<AppState, ActionNewsLoadMoreLoading>(_loadMoreNews),
  TypedMiddleware<AppState, ActionNewsRefresh>(_refreshNews),
];

final _repository = NewsRepository();

Future<void> _loadMoreNews(
    Store<AppState> store, ActionNewsLoadMoreLoading action, next) async {
  await next(action);

  final config = action.configModel;
  try {
    final response = await _repository.getData(config: config);

    final NewsPageViewModel viewModel = NewsPageViewModel.fromStore(store);

    final data = NewsPageModel(
      data: UnmodifiableListView<NewsModel>(
          [...viewModel.model.data, ...response.data]),
      nextIndex:
          response.data.length == 0 ? config.nextIndex : response.nextIndex,
      isReachedItem: response.data.length == 0,
    );

    await next(ActionNewsLoadMoreSuccess(data));
  } catch (e) {
    await next(ActionNewsLoadMoreError(config, e));
  }
}

Future<void> _refreshNews(
    Store<AppState> store, ActionNewsRefresh action, next) async {
  await next(action);

  final config = action.configModel;
  try {
    final response = await _repository.refresh(config: config);

    final data = NewsPageModel(
      data: response.data,
      nextIndex: response.nextIndex,
      isReachedItem: response.data.length == 0,
    );

    await next(ActionNewsLoadMoreSuccess(data));
  } catch (e) {
    await next(ActionNewsLoadMoreError(config, e));
  }
}
