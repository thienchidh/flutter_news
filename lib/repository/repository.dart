import 'package:flutter_news/model/load_more_model.dart';

mixin Repository<DataType> {
  Future<DataType> getData({ConfigModel config, dynamic optional});

  Future<DataType> refresh({ConfigModel config});
}
