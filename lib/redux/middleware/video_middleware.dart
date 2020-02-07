import 'dart:collection';

import 'package:flutter_news/model/video_model.dart';
import 'package:flutter_news/model/video_page_model.dart';
import 'package:flutter_news/redux/action/action_video.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/repository/datasource/video_datasoure.dart';
import 'package:flutter_news/viewmodel/video_page_viewmodel.dart';
import 'package:redux/redux.dart';

final List<Middleware<AppState>> videoMiddleware = [
  TypedMiddleware<AppState, ActionVideoLoadMoreLoading>(_loadMoreVideo),
];

Future<void> _loadMoreVideo(
    Store<AppState> store, ActionVideoLoadMoreLoading action, next) async {
  await next(action);

  final config = action.configModel;
  try {
    final dataSource = VideoDataSource();
    final response = await dataSource.fetchData(config);

    final VideoPageViewModel viewModel = VideoPageViewModel.fromStore(store);

    final data = VideoPageModel(
      data: UnmodifiableListView<VideoModel>(
          [...viewModel.model.data, ...response.data]),
      nextIndex: response.nextIndex,
      isReachedItem: response.data.length == 0,
    );

    await next(ActionVideoLoadMoreSuccess(data));
  } catch (e) {
    await next(ActionVideoLoadMoreError(config, e));
  }
}
