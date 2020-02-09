import 'dart:collection';

import 'package:meta/meta.dart';

@immutable
class MyResponse<T> {
  final UnmodifiableListView<T> data;
  final int nextIndex;

  MyResponse(this.data, this.nextIndex);
}
