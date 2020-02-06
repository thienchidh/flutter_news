import 'package:meta/meta.dart';

abstract class LoadMoreModel {
  final int nextIndex;
  final bool isReachedItem;

  LoadMoreModel({
    @required this.isReachedItem,
    @required this.nextIndex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoadMoreModel &&
          runtimeType == other.runtimeType &&
          nextIndex == other.nextIndex &&
          isReachedItem == other.isReachedItem;

  @override
  int get hashCode => nextIndex.hashCode ^ isReachedItem.hashCode;
}
