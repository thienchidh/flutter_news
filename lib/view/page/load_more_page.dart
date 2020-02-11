import 'package:flutter/material.dart';
import 'package:flutter_news/model/load_more_model/load_more_model.dart';
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
  final Widget Function(List<ModelType>, int) renderItem;

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
// TODO
//      onInitialBuild: (ViewModelType viewModel) {
//        viewModel.goToLastPositionOfScreen();
//      },
      builder: (BuildContext context, ViewModelType viewModel) {
        final model = viewModel.model;
        final data = model.data;

        bool didLoadMore = false;

        return NotificationListener<ScrollUpdateNotification>(
          onNotification: (ScrollUpdateNotification notification) {
            final metrics = notification.metrics;

            viewModel.saveScreenPosition(metrics.pixels);

            if (metrics.pixels + 200 >= metrics.maxScrollExtent) {
              didLoadMore = _loadMore(viewModel, didLoadMore);
            }
            return false;
          },
          child: SafeArea(
            top: false,
            bottom: false,
            child: Builder(
              // This Builder is needed to provide a BuildContext that is "inside"
              // the NestedScrollView, so that sliverOverlapAbsorberHandleFor() can
              // find the NestedScrollView.

              builder: (BuildContext context) {
                return RefreshIndicator(
                  onRefresh: viewModel.onRefresh,
                  child: Scrollbar(
                    child: CustomScrollView(
                      shrinkWrap: true,
                      // The "controller" and "primary" members should be left
                      // unset, so that the NestedScrollView can control this
                      // inner scroll view.
                      // If the "controller" property is set, then this scroll
                      // view will not be associated with the NestedScrollView.
                      // The PageStorageKey should be unique to this ScrollView;
                      // it allows the list to remember its scroll position when
                      // the tab view is not on the screen.
                      key: PageStorageKey<String>(viewModel.title),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              if (index < data.length) {
                                return widget.renderItem(data, index);
                              }
                              if (viewModel.isLoading) {
                                return LoadingItem();
                              }

                              if (viewModel.isError) {
                                return LoadingError(
                                  error: viewModel.error,
                                  onClick: viewModel.loadMore,
                                );
                              }

                              if (viewModel.isReachedItem) {
                                return LoadingReached(
                                  onClick: viewModel.loadMore,
                                );
                              }
                              if (data.length < 10) {
                                didLoadMore = _loadMore(viewModel, didLoadMore);
                              }
                              return null;
                            },
                            childCount: data.length + 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
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
