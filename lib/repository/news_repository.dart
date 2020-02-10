import 'package:flutter_news/model/news_model/news_model.dart';
import 'package:flutter_news/repository/cached/news_cached.dart';
import 'package:flutter_news/repository/datasource/news_datasoure.dart';
import 'package:flutter_news/repository/my_response_repository.dart';

class NewsRepository extends MyResponseRepository<NewsModel> {
  static final _instance = NewsRepository._();

  factory NewsRepository() => _instance;

  NewsRepository._() : super(NewsDataSource(), NewsCached());
}
