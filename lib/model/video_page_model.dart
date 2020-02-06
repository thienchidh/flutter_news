import 'dart:collection';

import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/video_model.dart';
import 'package:meta/meta.dart';

@immutable
class VideoPageModel extends LoadMoreModel {
  final String title;
  final UnmodifiableListView<VideoModel> listVideoModel;

  VideoPageModel({
    @required this.title,
    @required this.listVideoModel,
    isReachedItem = false,
    nextIndex = 0,
  }) : super(isReachedItem: isReachedItem, nextIndex: nextIndex);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is VideoPageModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          listVideoModel == other.listVideoModel;

  @override
  int get hashCode => super.hashCode ^ title.hashCode ^ listVideoModel.hashCode;
}
