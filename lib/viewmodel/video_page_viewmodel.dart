import 'package:flutter_news/model/video_page_model.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class VideoPageViewModel {
  final VideoPageModel model;

  VideoPageViewModel({
    @required this.model,
  });

  static VideoPageViewModel fromStore(Store<AppState> store) {
    return VideoPageViewModel(
      model: store.state.videoPageState.model,
    );
  }
}
