import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/view/widgets/item_loading.dart';
import 'package:flutter_news/view/widgets/news_item.dart';
import 'package:flutter_news/viewmodel/news_page_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => NewsPageViewModel.fromStore(store),
      builder: (BuildContext context, NewsPageViewModel viewModel) {
        final data = viewModel.model.listNewsModel;

        return ListView.builder(
          controller: _controller,
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
            return null;
            return LoadingItem();
          },
        );
      },
    );
  }
}
