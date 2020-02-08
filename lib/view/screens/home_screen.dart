import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/view/widgets/common_drawer.dart';
import 'package:flutter_news/viewmodel/home_screen_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      onInit: (Store<AppState> store) {
        _controller = ScrollController(
          keepScrollOffset: true,
          initialScrollOffset: 0,
        );
      },
      onInitialBuild: (HomeScreenViewModel viewModel) {
        viewModel.bindBackToTopFunc(_backToTop);
        viewModel.bindScrollToFunc(_scrollTo);
      },
      onDispose: (_) {
        _controller.dispose();
      },
      converter: (Store<AppState> store) =>
          HomeScreenViewModel.fromStore(store),
      builder: (BuildContext context, HomeScreenViewModel viewModel) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: _backToTop,
            child: Icon(Icons.keyboard_arrow_up),
            mini: true,
            isExtended: true,
          ),
          drawer: CommonDrawer(),
          body: DefaultTabController(
            length: viewModel.pagesModel.length,
            child: NestedScrollView(
              controller: _controller,
              body: TabBarView(
                children: [
                  ...viewModel.pagesModel
                      .map((pageViewModel) => pageViewModel.page),
                ],
              ),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    title: Text(viewModel.title),
                    pinned: true,
                    floating: true,
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: [
                        ...viewModel.pagesModel.map((pageModel) => Tab(
                              icon: pageModel.icon,
                              text: pageModel.title,
                            )),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ),
        );
      },
    );
  }

  void _backToTop() {
    if (_controller.hasClients) {
      _controller.animateTo(
        0,
        duration: Duration(seconds: 1),
        curve: Curves.bounceIn,
      );
    }
  }

  void _scrollTo(double pixel) {
    assert(_controller != null);
    if (_controller.hasClients) {
      _controller.jumpTo(pixel);
      print('pixels = ${_controller.position.maxScrollExtent}');
      print('${_controller.offset}');

//      (() async {
//        await _controller.animateTo(
//          pixel,
//          duration: Duration(
//            seconds: 10,
//          ),
//          curve: Curves.ease,
//        );
//      })();
    }
  }
}
