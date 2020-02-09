import 'dart:collection';

import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/video_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable(nullable: false)
@immutable
class VideoPageModel extends LoadMoreModel<VideoModel> {
  VideoPageModel({
    data,
    isReachedItem = false,
    nextIndex = 0,
  }) : super(
          isReachedItem: isReachedItem,
          nextIndex: nextIndex,
          data: data ?? UnmodifiableListView<VideoModel>([]),
        );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is VideoPageModel &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
