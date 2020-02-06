import 'package:flutter_news/model/news_page_model.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

@immutable
class NewsPageViewModel {
  final NewsPageModel model;

  NewsPageViewModel({
    @required this.model,
  });

  static NewsPageViewModel fromStore(Store<AppState> store) {
    return NewsPageViewModel(
      model: store.state.newsPageState.model,
    );
  }
}
