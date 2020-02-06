import 'dart:collection';

import 'package:flutter_news/model/video_model.dart';
import 'package:flutter_news/model/video_page_model.dart';
import 'package:meta/meta.dart';

@immutable
class VideoPageState {
  final VideoPageModel model;

  VideoPageState({
    @required this.model,
  });

  VideoPageState copyOf({model}) {
    return VideoPageState(
      model: model ?? this.model,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoPageState &&
          runtimeType == other.runtimeType &&
          model == other.model;

  @override
  int get hashCode => model.hashCode;

  static VideoPageState initialize() {
    return VideoPageState(
      model: VideoPageModel(
        title: "Video Page",
        listVideoModel: UnmodifiableListView<VideoModel>([
          // TODO empty list
          VideoModel(
            title: '1',
            linkVideo:
                'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
          ),
          VideoModel(
            title: '2',
            linkVideo:
                'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
          ),
          VideoModel(
            title: '3',
            linkVideo:
                'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
          ),
          VideoModel(
            title: '4',
            linkVideo:
                'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
          ),
          VideoModel(
            title: '5',
            linkVideo:
                'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
          ),
        ]),
      ),
    );
  }
}
