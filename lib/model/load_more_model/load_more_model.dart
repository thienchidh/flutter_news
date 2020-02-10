import 'package:flutter_news/model/config_model/config_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoadMoreModel<T> extends ConfigModel {
  final List<T> data;

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
