import 'dart:collection';

import 'package:flutter_news/model/video_model.dart';
import 'package:flutter_news/model/video_page_model.dart';
import 'package:meta/meta.dart';

@immutable
class VideoPageState {
  final String title;
  final VideoPageModel model;
  final bool isLoading;
  final bool isError;
  final Error error;
  final double currentScrollOffset;
  final void Function() backToTop;

  VideoPageState({
    @required this.title,
    @required this.model,
    @required this.backToTop,
    this.isLoading = false,
    this.isError = false,
    this.error,
    this.currentScrollOffset = 0,
  });

  VideoPageState copyOf({
    String title,
    VideoPageState model,
    bool isLoading,
    bool isError,
    Error error,
    double currentScrollOffset,
    void Function() backToTop,
  }) {
    return VideoPageState(
      title: title ?? this.title,
      model: model ?? this.model,
      error: error ?? this.error,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      currentScrollOffset: currentScrollOffset ?? this.currentScrollOffset,
      backToTop: backToTop ?? this.backToTop,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoPageState &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          model == other.model &&
          isLoading == other.isLoading &&
          isError == other.isError &&
          error == other.error &&
          currentScrollOffset == other.currentScrollOffset;

  @override
  int get hashCode =>
      title.hashCode ^
      model.hashCode ^
      isLoading.hashCode ^
      isError.hashCode ^
      error.hashCode ^
      currentScrollOffset.hashCode;

  static VideoPageState initialize() {
    return VideoPageState(
      backToTop: () {},
      title: "Video Page",
      model: VideoPageModel(
        data: UnmodifiableListView<VideoModel>([
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
