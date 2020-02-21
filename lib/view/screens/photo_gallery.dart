import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PhotoViewGallery.builder(
          itemCount: 5,
          builder: (_, __) {
            return PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(
                  "https://avatars3.githubusercontent.com/u/39627681?s=40&v=4"),
            );
          },
          loadingChild: CircularProgressIndicator(),
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
    );
  }
}
