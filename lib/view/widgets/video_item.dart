import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoItem extends StatelessWidget {
  final VideoModel model;

  const VideoItem({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(
            model.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Chewie(
            controller: ChewieController(
              videoPlayerController:
                  VideoPlayerController.network(model.linkVideo),
              autoPlay: false,
              looping: true,
            ),
          ),
        ],
      ),
    );
  }
}
