import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/view/widgets/item_loading.dart';
import 'package:flutter_news/view/widgets/video_item.dart';
import 'package:flutter_news/viewmodel/video_page_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class VideoPage extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) {
        return VideoPageViewModel.fromStore(store);
      },
      builder: (BuildContext context, VideoPageViewModel viewModel) {
        final data = viewModel.model.listVideoModel;
        return ListView.builder(
          controller: _controller,
          itemCount: data.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < data.length) {
              return VideoItem(model: data[index]);
            }
            return LoadingItem();
          },
        );
      },
    );
  }
}
