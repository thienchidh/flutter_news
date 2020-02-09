import 'dart:collection';

import 'package:meta/meta.dart';

abstract class ConfigModel {
  final int nextIndex;
  final bool isReachedItem;

  ConfigModel({
    @required this.isReachedItem,
    @required this.nextIndex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigModel &&
          runtimeType == other.runtimeType &&
          nextIndex == other.nextIndex &&
          isReachedItem == other.isReachedItem;

  @override
  int get hashCode => nextIndex.hashCode ^ isReachedItem.hashCode;
}

@immutable
abstract class LoadMoreModel<T> extends ConfigModel {
  final UnmodifiableListView<T> data;

  LoadMoreModel({
    @required bool isReachedItem,
    @required int nextIndex,
    @required this.data,
  }) : super(isReachedItem: isReachedItem, nextIndex: nextIndex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is LoadMoreModel &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => super.hashCode ^ data.hashCode;
}
