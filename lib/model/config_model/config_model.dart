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
