import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable(nullable: false)
@immutable
class MyResponse<T> {
  final UnmodifiableListView<T> data;
  final int nextIndex;

  MyResponse(this.data, this.nextIndex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyResponse &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          nextIndex == other.nextIndex;

  @override
  int get hashCode => data.hashCode ^ nextIndex.hashCode;
}
