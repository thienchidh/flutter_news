import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/news_page_model.dart';
import 'package:meta/meta.dart';

@immutable
class ActionNewsLoadMore {
  final LoadMoreModel configModel;

  ActionNewsLoadMore(this.configModel);
}

class ActionNewsLoadMoreSuccess extends ActionNewsLoadMore {
  final NewsPageModel data;

  ActionNewsLoadMoreSuccess(LoadMoreModel configModel, this.data)
      : super(configModel);
}

class ActionNewsLoadMoreError extends ActionNewsLoadMore {
  final Error error;

  ActionNewsLoadMoreError(LoadMoreModel configModel, this.error)
      : super(configModel);
}
