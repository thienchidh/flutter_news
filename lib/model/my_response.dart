import 'package:meta/meta.dart';

@immutable
class MyResponse<T> {
  final List<T> data;
  final int nextIndex;

  MyResponse(this.data, this.nextIndex);
}
