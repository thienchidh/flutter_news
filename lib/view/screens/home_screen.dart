import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/view/widgets/common_drawer.dart';
import 'package:flutter_news/view/widgets/fab_item.dart';
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
          floatingActionButton: AnimatedFab(
            actions: <FloatingActionButton>[
              FloatingActionButton(
                heroTag: "fab1",
                onPressed: _backToTop,
                child: Icon(Icons.keyboard_arrow_up),
              ),
              FloatingActionButton(
                heroTag: "fab2",
                onPressed: _backToTop,
                child: Icon(Icons.keyboard_arrow_up),
              ),
            ],
          ),
          drawer: CommonDrawer(),
          body: DefaultTabController(
            length: viewModel.pagesModel.length,
            child: NestedScrollView(
              controller: _controller,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    // This widget takes the overlapping behavior of the SliverAppBar,
                    // and redirects it to the SliverOverlapInjector below. If it is
                    // missing, then it is possible for the nested "inner" scroll view
                    // below to end up under the SliverAppBar even when the inner
                    // scroll view thinks it has not been scrolled.
                    // This is not necessary if the "headerSliverBuilder" only builds
                    // widgets that do not overlap the next sliver.
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    child: SliverSafeArea(
                      top: false,
                      sliver: SliverAppBar(
                        title: Text(viewModel.title),
                        floating: true,
                        pinned: true,
                        snap: false,
                        primary: true,
                        forceElevated: innerBoxIsScrolled,
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
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  ...viewModel.pagesModel.map((pageModel) => pageModel.page),
                ],
              ),
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
    }
  }
}
