import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@immutable
class PageModel {
  final String title;
  final Icon icon;
  final Widget page;

  PageModel({
    this.title,
    this.icon,
    @required this.page,
  }) : assert((title != null) || (icon != null));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          icon == other.icon &&
          page == other.page;

  @override
  int get hashCode => title.hashCode ^ icon.hashCode ^ page.hashCode;
}
