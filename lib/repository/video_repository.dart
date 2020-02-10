import 'package:flutter_news/model/video_model/video_model.dart';
import 'package:flutter_news/repository/cached/video_cached.dart';
import 'package:flutter_news/repository/datasource/video_datasoure.dart';
import 'package:flutter_news/repository/my_response_repository.dart';

class VideoRepository extends MyResponseRepository<VideoModel> {
  VideoRepository() : super(VideoDataSource(), VideoCached());
}
