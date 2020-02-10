import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_news/model/my_response/my_response.dart';
import 'package:flutter_news/repository/cached/cached.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';

Type _typeOf<T>() => T;

class MyResponseCached<T> implements Cached<MyResponse<T>, int> {
  final MyResponse<T> Function(Map<String, dynamic>) fromJson;
  final Map<int, MyResponse<T>> _map;
  final Lock _lock;

  _CacheManager<int, MyResponse<T>> _cacheManager;

  MyResponseCached(this.fromJson)
      : assert(fromJson != null),
        _map = HashMap<int, MyResponse<T>>(),
        _lock = Lock(reentrant: true),
        super() {
    _cacheManager = _CacheManager(fromJson, _map);
  }

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
    await _lock.synchronized(() async {
      await _cacheManager.save(key, obj);
    });
    return _map[key] = obj;
  }

  @override
  Future<bool> exists(int key) async {
    return _map.containsKey(key);
  }

  @override
  Future<MyResponse<T>> operator [](int key) => read(key);
}

class _CacheManager<K, V extends MyResponse<dynamic>> extends BaseCacheManager {
  final V Function(Map<String, dynamic>) fromJson;
  final String key;

  final Map<K, V> referenceMap;

  _CacheManager(this.fromJson, this.referenceMap)
      : this.key = '${_typeOf<V>()}',
        super('${_typeOf<V>()}') {
    _loadAllCacheFromDisk();
  }

  Future<String> getFilePath() async {
    final directory = await getTemporaryDirectory();
    return join(directory.path, key);
  }

  Future<void> _loadAllCacheFromDisk() async {
    String filePath = await getFilePath();
    Directory dic = Directory(filePath);
    if (dic.existsSync()) {
      List<FileSystemEntity> child = dic.listSync();
      for (final item in child) {
        await _loadCache(item.path);
      }
    }
  }

  Future<void> _loadCache(String cachePath) async {
    File file = File(cachePath);
    if (file.existsSync()) {
      final json = file.readAsStringSync();
      try {
        Map<String, dynamic> map = jsonDecode(json);
        final K key = map["key"] as K;
        final Map<String, dynamic> value = map["value"] as Map<String, dynamic>;
        referenceMap[key] = fromJson(value);
      } catch (_ignored) {
        print('error: $_ignored');
      }
    }
  }

  Future<void> save(K key, V value) async {
    try {
      final bytes = await createFileBytes(key, value);
      if (bytes != null) {
        putFile('$key', bytes);
      }
    } catch (e) {
      print('______ $e');
    }
  }

  Future<Uint8List> createFileBytes(K key, V value) async {
    Map<String, dynamic> map = <String, dynamic>{
      "key": key,
      "value": value,
    };

    try {
      String tmpPath = join(await getFilePath(), '$key');
      File tmp = File(tmpPath);
      if (await tmp.exists()) {
        await tmp.delete(recursive: true);
      }
      await tmp.create(recursive: true);
      if (await tmp.exists()) {
        await tmp.writeAsString(jsonEncode(map));
        final bytes = await tmp.readAsBytes();
        await tmp.delete();
        return bytes;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
