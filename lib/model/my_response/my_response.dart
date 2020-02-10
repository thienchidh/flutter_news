import 'package:meta/meta.dart';

@immutable
abstract class MyResponse<T> {
  final List<T> data;
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
