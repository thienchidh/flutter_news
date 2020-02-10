import 'package:flutter_news/model/video_model/video_model.dart';
import 'package:flutter_news/model/video_page_model/video_page_model.dart';
import 'package:flutter_news/redux/action/action_video.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/repository/video_repository.dart';
import 'package:flutter_news/viewmodel/video_page_viewmodel.dart';
import 'package:redux/redux.dart';

final List<Middleware<AppState>> videoMiddleware = [
  TypedMiddleware<AppState, ActionVideoLoadMoreLoading>(_loadMoreVideo),
  TypedMiddleware<AppState, ActionVideoRefresh>(_refreshVideo),
];

final _repository = VideoRepository();

Future<void> _loadMoreVideo(
    Store<AppState> store, ActionVideoLoadMoreLoading action, next) async {
  await next(action);

  final config = action.configModel;
  try {
    final response = await _repository.getData(config: config);

    final VideoPageViewModel viewModel = VideoPageViewModel.fromStore(store);

    final data = VideoPageModel(
      data: List<VideoModel>.unmodifiable([
        ...viewModel.model.data,
        ...response.data,
      ]),
      nextIndex:
          response.data.length == 0 ? config.nextIndex : response.nextIndex,
      isReachedItem: response.data.length == 0,
    );

    await next(ActionVideoLoadMoreSuccess(data));
  } catch (e) {
    await next(ActionVideoLoadMoreError(config, e));
  }
}

Future<void> _refreshVideo(
    Store<AppState> store, ActionVideoRefresh action, next) async {
  await next(action);

  final config = action.configModel;
  try {
    final response = await _repository.refresh(config: config);

    final data = VideoPageModel(
      data: response.data,
      nextIndex: response.nextIndex,
      isReachedItem: response.data.length == 0,
    );

    await next(ActionVideoLoadMoreSuccess(data));
  } catch (e) {
    await next(ActionVideoLoadMoreError(config, e));
  }
}
