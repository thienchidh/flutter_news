mixin Cached<DataType, KeyType> {
  Future<bool> exists(KeyType key);

  Future<DataType> save(KeyType key, DataType obj);

  Future<DataType> operator [](KeyType key);

  Future<DataType> read(KeyType key);

  Future<void> clear();
}
