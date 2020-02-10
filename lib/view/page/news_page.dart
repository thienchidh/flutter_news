import 'package:flutter/material.dart';
import 'package:flutter_news/main.dart';
import 'package:flutter_news/model/news_model/news_model.dart';
import 'package:flutter_news/view/page/load_more_page.dart';
import 'package:flutter_news/view/widgets/news_item.dart';
import 'package:flutter_news/viewmodel/news_page_viewmodel.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadMorePage<NewsModel, NewsPageViewModel>(
      createViewModel: NewsPageViewModel.fromStore,
      renderItem: (List<NewsModel> data, int index) {
        return NewsItem(
          model: data[index],
          onClick: () {
            Navigator.pushNamed(
              context,
              RoutesName.DETAIL_NEWS_PAGE,
              arguments: data[index],
            );
          },
        );
      },
    );
  }
}
