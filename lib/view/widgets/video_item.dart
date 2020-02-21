import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/main.dart';
import 'package:flutter_news/model/video_model/video_model.dart';

class VideoItem extends StatelessWidget {
  final VideoModel model;

  const VideoItem({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO implements open video
          Navigator.pushNamed(
            context,
            RoutesName.VIDEO_DETAIL_PAGE,
            arguments: model,
          );
        },
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: CachedNetworkImage(
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Center(
              child: Icon(Icons.error),
            ),
            fit: BoxFit.cover,
            imageUrl: model.image,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
