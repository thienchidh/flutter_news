import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/video_page_model.dart';
import 'package:meta/meta.dart';

@immutable
class ActionVideoLoadMore {
  final LoadMoreModel configModel;

  ActionVideoLoadMore(this.configModel);
}

class ActionVideoLoadMoreSuccess extends ActionVideoLoadMore {
  final VideoPageModel data;

  ActionVideoLoadMoreSuccess(LoadMoreModel configModel, this.data)
      : super(configModel);
}

class ActionVideoLoadMoreError extends ActionVideoLoadMore {
  final Error error;

  ActionVideoLoadMoreError(LoadMoreModel configModel, this.error)
      : super(configModel);
}
