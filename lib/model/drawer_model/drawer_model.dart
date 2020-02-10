import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@immutable
class DrawerModel {
  final DrawerHeaderModel header;
  final List<DrawerBodyModel> items;

  DrawerModel({
    @required this.header,
    @required this.items,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrawerModel &&
          runtimeType == other.runtimeType &&
          header == other.header &&
          items == other.items;

  @override
  int get hashCode => header.hashCode ^ items.hashCode;
}

@immutable
class DrawerHeaderModel {
  final String title;

  DrawerHeaderModel({
    @required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrawerHeaderModel &&
          runtimeType == other.runtimeType &&
          title == other.title;

  @override
  int get hashCode => title.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrawerBodyModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          routeName == other.routeName &&
          icon == other.icon &&
          arguments == other.arguments;

  @override
  int get hashCode =>
      title.hashCode ^ routeName.hashCode ^ icon.hashCode ^ arguments.hashCode;
}
