import 'package:flutter_news/model/config_model/config_model.dart';
import 'package:flutter_news/model/my_response/my_response.dart';
import 'package:flutter_news/model/video_model/video_model.dart';
import 'package:flutter_news/model/video_response/video_response.dart';
import 'package:flutter_news/repository/datasource/datasource.dart';

class VideoDataSource implements DataSource<MyResponse<VideoModel>> {
  static VideoDataSource _instance = VideoDataSource._();

  VideoDataSource._();

  // singleton
  factory VideoDataSource() {
    return _instance;
  }

  @override
  Future<MyResponse<VideoModel>> fetchData(ConfigModel config,
      {optional}) async {
    // TODO: implement fetchData

    await Future.delayed(Duration(milliseconds: 500));

    final data = <VideoModel>[
      VideoModel(
        title: "example load more",
        linkVideo:
            "https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4",
      ),
    ];

    final list = List<VideoModel>.unmodifiable([
      ...data,
    ]);
    return VideoResponse(list, config.nextIndex + list.length);
  }
}
