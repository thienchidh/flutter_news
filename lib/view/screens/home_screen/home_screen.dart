import 'package:flutter/material.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/view/widgets/common_drawer.dart';
import 'package:flutter_news/viewmodel/home_screen_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) =>
          HomeScreenViewModel.fromStore(store),
      builder: (BuildContext context, HomeScreenViewModel viewModel) {
        return DefaultTabController(
          length: viewModel.screenModel.pagesModel.length,
          child: Scaffold(
            drawer: CommonDrawer(),
            appBar: AppBar(
              title: Text(viewModel.screenModel.title),
              bottom: TabBar(
                tabs: [
                  ...viewModel.screenModel.pagesModel
                      .map((pageViewModel) => Tab(
                            icon: pageViewModel.icon,
                            text: pageViewModel.title,
                          )),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ...viewModel.screenModel.pagesModel
                    .map((pageViewModel) => pageViewModel.page),
              ],
            ),
          ),
        );
      },
    );
  }
}
