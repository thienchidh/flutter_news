import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/my_response.dart';
import 'package:flutter_news/repository/cached/cached.dart';
import 'package:flutter_news/repository/datasource/datasource.dart';
import 'package:flutter_news/repository/repository.dart';

class MyResponseRepository<T> implements Repository<MyResponse<T>> {
  final DataSource<MyResponse<T>> dataSource;
  final Cached<MyResponse<T>, int> cached;

  MyResponseRepository(this.dataSource, this.cached);

  @override
  Future<MyResponse<T>> getData({ConfigModel config, optional}) async {
    final nextIndex = config != null ? config.nextIndex : 0;

    if (await cached.exists(nextIndex)) {
      return cached.read(nextIndex);
    }
    final MyResponse<T> data = await dataSource.fetchData(
      config,
      optional: optional,
    );

    await cached.save(config.nextIndex, data);

    return data;
  }

  @override
  Future<MyResponse<T>> refresh({ConfigModel config}) async {
    await cached.clear();
    return await getData(config: config);
  }
}
