import 'package:flutter_news/model/video_model/video_model.dart';
import 'package:flutter_news/model/video_response/video_response.dart';
import 'package:flutter_news/repository/cached/my_response_cached.dart';

class VideoCached extends MyResponseCached<VideoModel> {
  VideoCached() : super(VideoResponse.fromJsonInStatic);
}
