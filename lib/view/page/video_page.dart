import 'package:flutter/material.dart';
import 'package:flutter_news/model/video_model/video_model.dart';
import 'package:flutter_news/view/page/load_more_page.dart';
import 'package:flutter_news/view/widgets/video_item.dart';
import 'package:flutter_news/viewmodel/video_page_viewmodel.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadMorePage<VideoModel, VideoPageViewModel>(
      createViewModel: VideoPageViewModel.fromStore,
      renderItem: (List<VideoModel> data, int index) {
        return VideoItem(
          model: data[index],
        );
      },
    );
  }
}
