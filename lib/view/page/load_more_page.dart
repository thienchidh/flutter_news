import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/view/widgets/item_loading.dart';
import 'package:flutter_news/viewmodel/page_load_more_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoadMorePage<
    ModelType,
    ViewModelType extends PageLoadMoreViewModel<ModelType,
        LoadMoreModel<ModelType>>> extends StatefulWidget {
  final ViewModelType Function(Store<AppState>) createViewModel;
  final Widget Function(UnmodifiableListView<ModelType>, int) renderItem;

  const LoadMorePage({
    Key key,
    @required this.createViewModel,
    @required this.renderItem,
  }) : super(key: key);

  @override
  _LoadMorePageState createState() =>
      _LoadMorePageState<ModelType, ViewModelType>();
}

class _LoadMorePageState<
ModelType,
ViewModelType extends PageLoadMoreViewModel<ModelType,
    LoadMoreModel<ModelType>>>
    extends State<LoadMorePage<ModelType, ViewModelType>> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => widget.createViewModel(store),
// FIXME
//      onInitialBuild: (ViewModelType viewModel) {
//        viewModel.goToLastPositionOfScreen();
//      },
      builder: (BuildContext context, ViewModelType viewModel) {
        final model = viewModel.model;
        final data = model.data;

        bool didLoadMore = false;
        if (data.isEmpty) {
          didLoadMore = _loadMore(viewModel, didLoadMore);
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollNotification) {
            final metrics = scrollNotification.metrics;

            viewModel.saveScreenPosition(metrics.pixels);

            if (metrics.pixels + 200 >= metrics.maxScrollExtent) {
              didLoadMore = _loadMore(viewModel, didLoadMore);
            }
            return false;
          },
          child: RefreshIndicator(
            child: ListView.builder(
              itemCount: data.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < data.length) {
                  return widget.renderItem(data, index);
                }
                if (viewModel.isLoading) {
                  return LoadingItem();
                }

                if (viewModel.isError) {
                  return LoadingError(error: viewModel.error);
                }

                if (viewModel.isReachedItem) {
                  return LoadingReached();
                }
                return null;
              },
            ),
            onRefresh: viewModel.onRefresh,
          ),
        );
      },
    );
  }

  bool _loadMore(final ViewModelType viewModel, final bool oldState) {
    if (!viewModel.isLoading &&
        !viewModel.isReachedItem &&
        !viewModel.isError &&
        !oldState) {
      final bool newState = true;
      viewModel.loadMore();
      return newState;
    }
    return oldState;
  }
}
