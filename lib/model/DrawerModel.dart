import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@immutable
class DrawerHeaderModel {
  final String title;

  DrawerHeaderModel({
    @required this.title,
  });
}

@immutable
class DrawerBodyModel {
  final String title;
  final String routeName;
  final Icon icon;
  final dynamic arguments;

  DrawerBodyModel({
    @required this.icon,
    @required this.title,
    @required this.routeName,
    this.arguments,
  });
}
