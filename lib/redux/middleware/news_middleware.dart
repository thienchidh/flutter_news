import 'dart:collection';

import 'package:flutter_news/model/my_response.dart';
import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/model/news_page_model.dart';
import 'package:flutter_news/redux/action/action_news.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/repository/datasource/news_datasoure.dart';
import 'package:flutter_news/viewmodel/news_page_viewmodel.dart';
import 'package:redux/redux.dart';

class NewsMiddleWare extends MiddlewareClass<AppState> {
  final dataSource = NewsDataSource();

  @override
  call(Store<AppState> store, action, next) async {
    next(action);

    if (action is ActionNewsLoadMore) {
      final config = action.configModel;
      try {
        final MyResponse<NewsModel> response =
            await dataSource.fetchData(config);

        final NewsPageViewModel viewModel = NewsPageViewModel.fromStore(store);

        final data = NewsPageModel(
          listNewsModel: UnmodifiableListView<NewsModel>(
              [...viewModel.model.listNewsModel, ...response.data]),
          nextIndex: response.nextIndex,
          title: viewModel.title,
          isReachedItem: response.data.length > 0,
        );
        final newConfig = data;
        next(ActionNewsLoadMoreSuccess(newConfig, data));
      } catch (e) {
        next(ActionNewsLoadMoreError(config, e));
      }
    }
  }
}
