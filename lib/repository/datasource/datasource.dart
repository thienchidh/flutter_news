import 'package:flutter_news/model/config_model/config_model.dart';

mixin DataSource<Response> {
  Future<Response> fetchData(ConfigModel config, {optional});
}
