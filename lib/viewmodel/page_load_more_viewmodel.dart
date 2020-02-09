import 'dart:collection';

import 'package:flutter_news/model/load_more_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PageLoadMoreViewModel<ItemModelType,
    PageModelType extends LoadMoreModel<ItemModelType>> {
  final String title;
  final PageModelType model;
  final bool isLoading;
  final bool isError;
  final bool isReachedItem;
  final Error error;
  final double currentScrollOffset;

  final void Function() loadMore;
  final bool Function(double) saveScreenPosition;
  final Future<bool> Function() onRefresh;
  final void Function() goToLastPositionOfScreen;

  UnmodifiableListView<ItemModelType> get data;

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
    @required this.goToLastPositionOfScreen,
  })  : assert(model != null),
        assert(loadMore != null),
        assert(isError != null),
        assert(isLoading != null),
        assert(isReachedItem != null),
        assert(title != null),
        assert(saveScreenPosition != null),
        assert(currentScrollOffset != null),
        assert(goToLastPositionOfScreen != null),
        assert(onRefresh != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageLoadMoreViewModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          model == other.model &&
          isLoading == other.isLoading &&
          isError == other.isError &&
          isReachedItem == other.isReachedItem &&
          error == other.error &&
          currentScrollOffset == other.currentScrollOffset &&
          loadMore == other.loadMore &&
          saveScreenPosition == other.saveScreenPosition &&
          onRefresh == other.onRefresh &&
          goToLastPositionOfScreen == other.goToLastPositionOfScreen;

  @override
  int get hashCode =>
      title.hashCode ^
      model.hashCode ^
      isLoading.hashCode ^
      isError.hashCode ^
      isReachedItem.hashCode ^
      error.hashCode ^
      currentScrollOffset.hashCode ^
      loadMore.hashCode ^
      saveScreenPosition.hashCode ^
      onRefresh.hashCode ^
      goToLastPositionOfScreen.hashCode;
}
