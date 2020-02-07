import 'package:meta/meta.dart';

@immutable
abstract class ActionBindBackToTopFunc {
  final void Function() backToTop;

  ActionBindBackToTopFunc(this.backToTop);
}

@immutable
class ActionNewsBindBackToTopFunc extends ActionBindBackToTopFunc {
  ActionNewsBindBackToTopFunc(void Function() backToTop) : super(backToTop);
}

@immutable
class ActionVideoBindBackToTopFunc extends ActionBindBackToTopFunc {
  ActionVideoBindBackToTopFunc(void Function() backToTop) : super(backToTop);
}
