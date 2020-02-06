import 'dart:ui';

import 'package:flutter_news/model/video_page_model.dart';
import 'package:flutter_news/redux/action/action_video.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class VideoPageViewModel {
  final String title;
  final VideoPageModel model;
  final bool isLoading;
  final bool isError;
  final bool isReachedItem;
  final Error error;

  final VoidCallback loadMore;

  VideoPageViewModel({
    @required this.model,
    @required this.loadMore,
    @required this.error,
    @required this.isError,
    @required this.isLoading,
    @required this.isReachedItem,
    @required this.title,
  });

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
      title: model.title,
    );
  }
}
