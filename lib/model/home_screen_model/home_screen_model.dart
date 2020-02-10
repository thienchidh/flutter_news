import 'package:flutter/material.dart';
import 'package:flutter_news/model/page_model/page_model.dart';
import 'package:meta/meta.dart';

@immutable
class HomeScreenModel {
  final String title;
  final List<PageModel> pagesModel;

  HomeScreenModel({
    @required this.title,
    @required this.pagesModel,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeScreenModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          pagesModel == other.pagesModel;

  @override
  int get hashCode => title.hashCode ^ pagesModel.hashCode;
}
