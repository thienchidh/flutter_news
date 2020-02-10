import 'package:flutter_news/model/news_model/news_model.dart';
import 'package:flutter_news/model/news_response/news_response.dart';
import 'package:flutter_news/repository/cached/my_response_cached.dart';

class NewsCached extends MyResponseCached<NewsModel> {
  NewsCached() : super(NewsResponse.fromJsonInStatic);
}
