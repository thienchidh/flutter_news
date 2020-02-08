import 'package:flutter_news/model/load_more_model.dart';
import 'package:flutter_news/model/my_response.dart';
import 'package:flutter_news/model/video_model.dart';
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

    final data = <VideoModel>[
      VideoModel(
        title: "example load more",
        linkVideo:
            "https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4",
      ),
    ];
    return MyResponse([
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
      ...data,
    ], config.nextIndex + data.length);
  }
}