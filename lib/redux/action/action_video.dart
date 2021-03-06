import 'package:flutter_news/model/config_model/config_model.dart';
import 'package:flutter_news/model/video_page_model/video_page_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ActionVideoLoadMore {
  final ConfigModel configModel;

  ActionVideoLoadMore(this.configModel);
}

@immutable
class ActionVideoLoadMoreLoading extends ActionVideoLoadMore {
  ActionVideoLoadMoreLoading(ConfigModel configModel) : super(configModel);
}

class ActionVideoLoadMoreSuccess extends ActionVideoLoadMore {
  final VideoPageModel data;

  ActionVideoLoadMoreSuccess(this.data) : super(data);
}

class ActionVideoLoadMoreError extends ActionVideoLoadMore {
  final Exception error;

  ActionVideoLoadMoreError(ConfigModel configModel, this.error)
      : super(configModel);
}

@immutable
class ActionChangeVideoListViewPosition {
  final double pixel;

  ActionChangeVideoListViewPosition(this.pixel);
}

@immutable
class ActionVideoRefresh extends ActionVideoLoadMore {
  ActionVideoRefresh(ConfigModel configModel) : super(configModel);
}
