import 'package:flutter_news/model/load_more_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageLoadMoreViewModel<T extends LoadMoreModel> {
  final String title;
  final T model;
  final bool isLoading;
  final bool isError;
  final bool isReachedItem;
  final Error error;
  final double currentScrollOffset;

  final void Function() loadMore;
  final void Function(void Function()) bindBackToTopFunc;
  final bool Function(double) saveScreenPosition;
  final Future<bool> Function() onRefresh;

  PageLoadMoreViewModel({
    @required this.model,
    @required this.loadMore,
    @required this.error,
    @required this.isError,
    @required this.isLoading,
    @required this.isReachedItem,
    @required this.title,
    @required this.saveScreenPosition,
    @required this.currentScrollOffset,
    @required this.onRefresh,
    @required this.bindBackToTopFunc,
  })  : assert(model != null),
        assert(loadMore != null),
        assert(isError != null),
        assert(isLoading != null),
        assert(isReachedItem != null),
        assert(title != null),
        assert(saveScreenPosition != null),
        assert(currentScrollOffset != null),
        assert(bindBackToTopFunc != null),
        assert(onRefresh != null);
}
