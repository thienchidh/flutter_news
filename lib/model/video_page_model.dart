import 'dart:collection';

import 'package:flutter_news/model/video_model.dart';
import 'package:meta/meta.dart';

@immutable
class VideoPageModel {
  final String title;
  final UnmodifiableListView<VideoModel> listVideoModel;
  final bool isReachedItem;

  VideoPageModel({
    @required this.title,
    @required this.listVideoModel,
    this.isReachedItem = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoPageModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          listVideoModel == other.listVideoModel &&
          isReachedItem == other.isReachedItem;

  @override
  int get hashCode =>
      title.hashCode ^ listVideoModel.hashCode ^ isReachedItem.hashCode;
}
