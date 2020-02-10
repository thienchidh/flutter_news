import 'package:flutter_news/model/my_response/my_response.dart';
import 'package:flutter_news/model/video_model/video_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_response.g.dart';

@JsonSerializable(nullable: false)
class VideoResponse extends MyResponse<VideoModel> {
  VideoResponse(List<VideoModel> data, int nextIndex) : super(data, nextIndex);

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return _$VideoResponseFromJson(json);
  }

  static VideoResponse fromJsonInStatic(Map<String, dynamic> json) {
    return _$VideoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VideoResponseToJson(this);
  }
}
