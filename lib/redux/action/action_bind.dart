import 'package:meta/meta.dart';

@immutable
abstract class ActionBind {}

@immutable
class ActionBindBackToTopFunc extends ActionBind {
  final void Function() func;

  ActionBindBackToTopFunc(this.func);
}

@immutable
class ActionBindScrollFunc extends ActionBind {
  final void Function(double) func;

  ActionBindScrollFunc(this.func);
}
