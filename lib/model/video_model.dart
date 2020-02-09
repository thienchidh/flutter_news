import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable(nullable: false)
@immutable
class VideoModel {
  final String title;
  final String linkVideo;

  VideoModel({
    @required this.title,
    @required this.linkVideo,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          linkVideo == other.linkVideo;

  @override
  int get hashCode => title.hashCode ^ linkVideo.hashCode;
}
