import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/model/video_model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoItemDetail extends StatefulWidget {
  final VideoModel model;

  const VideoItemDetail({Key key, @required this.model}) : super(key: key);

  @override
  _VideoItemDetailState createState() => _VideoItemDetailState();
}

class _VideoItemDetailState extends State<VideoItemDetail> {
  ChewieController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ChewieController(
      videoPlayerController:
          VideoPlayerController.network(widget.model.linkVideo),
      autoInitialize: true,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(
            widget.model.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Chewie(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}
