import 'dart:collection';

import 'package:flutter_news/model/video_model.dart';
import 'package:flutter_news/model/video_page_model.dart';
import 'package:flutter_news/redux/action/action_bind.dart';
import 'package:flutter_news/redux/action/action_video.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/viewmodel/page_load_more_viewmodel.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class VideoPageViewModel extends PageLoadMoreViewModel<VideoPageModel> {
  VideoPageViewModel({
    @required model,
    @required loadMore,
    @required error,
    @required isError,
    @required isLoading,
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

  static VideoPageViewModel fromStore(Store<AppState> store) {
    final state = store.state.videoPageState;
    final model = state.model;
    return VideoPageViewModel(
      model: model,
      loadMore: () {
        if (state.isLoading) {
          return;
        }
        store.dispatch(ActionVideoLoadMore(model));
      },
      error: state.error,
      isError: state.isError,
      isLoading: state.isLoading,
      isReachedItem: state.model.isReachedItem,
      title: state.title,
      saveScreenPosition: (double pixel) {
        if ((pixel - state.currentScrollOffset).abs() >= 1) {
          store.dispatch(ActionChangeVideoListViewPosition(pixel));
          return true;
        }
        return false;
      },
      currentScrollOffset: state.currentScrollOffset,
      onRefresh: () async {
        await store.dispatch(ActionChangeVideoListViewPosition(0));
        await store.dispatch(ActionVideoLoadMoreSuccess(VideoPageModel(
          data: UnmodifiableListView<VideoModel>([]),
        )));
        return true;
      },
      bindBackToTopFunc: (func) {
        if (store.state.homeScreenState.backToTop != func) {
          store.dispatch(ActionVideoBindBackToTopFunc(func));
        }
      },
    );
  }
}
