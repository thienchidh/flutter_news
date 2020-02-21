import 'package:flutter/material.dart';
import 'package:flutter_news/model/video_model/video_model.dart';
import 'package:flutter_news/view/widgets/video_item_detail.dart';

class VideoScreenDetail extends StatelessWidget {
  final VideoModel model;

  const VideoScreenDetail({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: VideoItemDetail(
          model: model,
        ),
      ),
    );
  }
}
