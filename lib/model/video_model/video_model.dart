import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'video_model.g.dart';

@JsonSerializable(nullable: false)
@immutable
class VideoModel {
  final String title;
  final String image;
  final String linkVideo;

  VideoModel({
    @required this.title,
    @required this.image,
    @required this.linkVideo,
  }) : assert(image != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is VideoModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          image == other.image &&
          linkVideo == other.linkVideo;

  @override
  int get hashCode => title.hashCode ^ image.hashCode ^ linkVideo.hashCode;

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return _$VideoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VideoModelToJson(this);
  }
}
