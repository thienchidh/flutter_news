import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/view/widgets/item_loading.dart';
import 'package:flutter_news/view/widgets/video_item.dart';
import 'package:flutter_news/viewmodel/video_page_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class VideoPage extends StatelessWidget {
  final flag = []; // to send load more request only 1 time / state

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) {
        return VideoPageViewModel.fromStore(store);
      },
      builder: (BuildContext context, VideoPageViewModel viewModel) {
        final model = viewModel.model;
        final data = model.listVideoModel;
        flag.clear();

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollNotification) {
            final metrics = scrollNotification.metrics;
            if (metrics.pixels + 500 >= metrics.maxScrollExtent) {
              if (!viewModel.isLoading && flag.isEmpty) {
                flag.add(null);

                viewModel.loadMore();
              }
            }
            return true;
          },
          child: ListView.builder(
            itemCount: data.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < data.length) {
                return VideoItem(model: data[index]);
              }

              if (viewModel.isLoading) {
                return LoadingItem();
              }

              if (viewModel.isError) {
                return LoadingError();
              }

              if (viewModel.isReachedItem) {
                // TODO
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
