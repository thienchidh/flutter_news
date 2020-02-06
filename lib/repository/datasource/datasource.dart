import 'package:flutter_news/model/load_more_model.dart';

mixin DataSource<Response> {
  Future<Response> fetchData(LoadMoreModel config, {optional});
}
