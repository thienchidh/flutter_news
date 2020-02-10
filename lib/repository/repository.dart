import 'package:flutter_news/model/config_model/config_model.dart';

mixin Repository<DataType> {
  Future<DataType> getData({ConfigModel config, dynamic optional});

  Future<DataType> refresh({ConfigModel config});
}
