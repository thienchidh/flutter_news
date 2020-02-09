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
  final void Function(double) scrollTo;

  VideoPageState({
    @required this.title,
    @required this.model,
    @required this.backToTop,
    @required this.scrollTo,
    this.isLoading = false,
    this.isError = false,
    this.error,
    this.currentScrollOffset = 0,
  });

  VideoPageState copyOf({
    String title,
    VideoPageModel model,
    bool isLoading,
    bool isError,
    Error error,
    double currentScrollOffset,
    void Function() backToTop,
    void Function(double) scrollTo,
  }) {
    return VideoPageState(
      title: title ?? this.title,
      model: model ?? this.model,
      error: error ?? this.error,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      currentScrollOffset: currentScrollOffset ?? this.currentScrollOffset,
      backToTop: backToTop ?? this.backToTop,
      scrollTo: scrollTo ?? this.scrollTo,
    );
  }

  static VideoPageState initialize() {
    return VideoPageState(
      scrollTo: (_) {},
      backToTop: () {},
      title: "Video Page",
      model: VideoPageModel(
        data: UnmodifiableListView<VideoModel>([]),
      ),
    );
  }
}
