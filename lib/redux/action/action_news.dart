import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/news_page_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ActionNews {}

@immutable
abstract class ActionNewsLoadMore {
  final ConfigModel configModel;

  ActionNewsLoadMore(this.configModel);
}

@immutable
class ActionNewsLoadMoreLoading extends ActionNewsLoadMore {
  ActionNewsLoadMoreLoading(ConfigModel configModel) : super(configModel);
}

@immutable
class ActionNewsLoadMoreSuccess extends ActionNewsLoadMore {
  final NewsPageModel data;

  ActionNewsLoadMoreSuccess(this.data) : super(data);
}

@immutable
class ActionNewsLoadMoreError extends ActionNewsLoadMore {
  final Error error;

  ActionNewsLoadMoreError(ConfigModel configModel, this.error)
      : super(configModel);
}

@immutable
class ActionChangeNewsListViewPosition {
  final double pixel;

  ActionChangeNewsListViewPosition(this.pixel);
}
