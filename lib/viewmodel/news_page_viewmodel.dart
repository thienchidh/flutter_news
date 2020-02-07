import 'dart:collection';

import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/model/news_page_model.dart';
import 'package:flutter_news/redux/action/action_bind.dart';
import 'package:flutter_news/redux/action/action_news.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/viewmodel/page_load_more_viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class NewsPageViewModel extends PageLoadMoreViewModel<NewsPageModel> {
  NewsPageViewModel({
    @required model,
    @required loadMore,
    @required isLoading,
    @required isError,
    @required error,
    @required isReachedItem,
    @required title,
    @required saveScreenPosition,
    @required currentScrollOffset,
    @required onRefresh,
    @required bindBackToTopFunc,
  }) : super(
          model: model,
          loadMore: loadMore,
          error: error,
          isError: isError,
          isLoading: isLoading,
          isReachedItem: isReachedItem,
          title: title,
          saveScreenPosition: saveScreenPosition,
          currentScrollOffset: currentScrollOffset,
          onRefresh: onRefresh,
          bindBackToTopFunc: bindBackToTopFunc,
        );

  static NewsPageViewModel fromStore(Store<AppState> store) {
    final state = store.state.newsPageState;
    final model = state.model;
    return NewsPageViewModel(
      model: model,
      loadMore: () {
        if (state.isLoading) {
          return;
        }
        store.dispatch(ActionNewsLoadMoreLoading(model));
      },
      isLoading: state.isLoading,
      isError: state.isError,
      error: state.error,
      isReachedItem: state.model.isReachedItem,
      title: state.title,
      saveScreenPosition: (double pixel) {
        if ((pixel - state.currentScrollOffset).abs() >= 1) {
          store.dispatch(ActionChangeNewsListViewPosition(pixel));
          return true;
        }
        return false;
      },
      currentScrollOffset: state.currentScrollOffset,
      onRefresh: () async {
        await store.dispatch(ActionChangeNewsListViewPosition(0));
        await store.dispatch(ActionNewsLoadMoreSuccess(NewsPageModel(
          data: UnmodifiableListView<NewsModel>([]),
        )));
        return true;
      },
      bindBackToTopFunc: (func) {
        if (store.state.homeScreenState.backToTop != func) {
          store.dispatch(ActionNewsBindBackToTopFunc(func));
        }
      },
    );
  }
}
