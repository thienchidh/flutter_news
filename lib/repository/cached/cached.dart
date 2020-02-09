mixin Cached<DataType, KeyType> {
  Future<bool> exists(KeyType key);

  Future<DataType> save(KeyType key, DataType obj);

  Future<DataType> read(KeyType key);

  Future<void> clear();
}
