import 'dart:async';
import 'dart:collection';

import 'package:flutter_news/model/my_response.dart';
import 'package:flutter_news/repository/cached/cached.dart';

class MyResponseCached<T> implements Cached<MyResponse<T>, int> {
  final Map<int, MyResponse<T>> _map = HashMap<int, MyResponse<T>>();

//  final DefaultCacheManager _cacheManager = DefaultCacheManager();

  @override
  Future<void> clear() async {
//    await _cacheManager.emptyCache();
    _map.clear();
  }

  @override
  Future<MyResponse<T>> read(int key) async {
    return _map[key];
  }

  @override
  Future<MyResponse<T>> save(int key, MyResponse<T> obj) async {
    return _map[key] = obj;
  }

  @override
  Future<bool> exists(int key) async {
    // TODO
    return false;
//    return _map.containsKey(key);
  }
}
