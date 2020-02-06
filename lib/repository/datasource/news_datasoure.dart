import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/my_response.dart';
import 'package:flutter_news/model/news_model.dart';
import 'package:flutter_news/repository/datasource/datasource.dart';

class NewsDataSource implements DataSource<MyResponse<NewsModel>> {
  @override
  Future<MyResponse<NewsModel>> fetchData(LoadMoreModel config,
      {optional}) async {
    // TODO: implement fetchData

    final data = <NewsModel>[
      NewsModel(
        title: "example load more",
        country: "VN",
        linkImage:
            "https://photo-resize-zmp3.zadn.vn/w240_r1x1_jpeg/cover/1/8/f/0/18f09289e6711ee7c62295dc2c464e35.jpg",
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    ];
    return MyResponse([
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
    ], config.nextIndex + data.length);
  }
}
