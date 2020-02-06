import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/view/widgets/item_loading.dart';
import 'package:flutter_news/view/widgets/news_item.dart';
import 'package:flutter_news/viewmodel/news_page_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NewsPage extends StatelessWidget {
  final flag = []; // to send load more request only 1 time / state

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => NewsPageViewModel.fromStore(store),
      builder: (BuildContext context, NewsPageViewModel viewModel) {
        final model = viewModel.model;
        final data = model.listNewsModel;

        flag.clear();

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            final metrics = scrollInfo.metrics;
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
            itemBuilder: (context, index) {
              if (index < data.length) {
                return NewsItem(
                  model: data[index],
                  onClick: () {
                    // TODO
                    print('click item $index');
                  },
                );
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
