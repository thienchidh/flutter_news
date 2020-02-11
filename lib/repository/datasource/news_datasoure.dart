import 'package:flutter_news/model/config_model/config_model.dart';
import 'package:flutter_news/model/my_response/my_response.dart';
import 'package:flutter_news/model/news_model/news_model.dart';
import 'package:flutter_news/model/news_response/news_response.dart';
import 'package:flutter_news/repository/datasource/datasource.dart';

class NewsDataSource implements DataSource<MyResponse<NewsModel>> {
  static NewsDataSource _instance = NewsDataSource._();

  NewsDataSource._();

  // singleton
  factory NewsDataSource() {
    return _instance;
  }

  @override
  Future<MyResponse<NewsModel>> fetchData(ConfigModel config,
      {optional}) async {
    // TODO: implement fetchData

    await Future.delayed(Duration(milliseconds: 500));

    final data = <NewsModel>[
      NewsModel(
        title: "example load more",
        country: "VN",
        linkImage:
            "https://picsum.photos/200/300?timestamp=${DateTime.now().millisecondsSinceEpoch}",
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    ];

    final list = List<NewsModel>.unmodifiable([
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
    ]);
    return NewsResponse(list, config.nextIndex + list.length);
  }
}
