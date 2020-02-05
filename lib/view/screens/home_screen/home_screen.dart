import 'package:flutter/material.dart';
import 'package:flutter_news/view/screens/home_screen/home_screen_viewmodel.dart';
import 'package:flutter_news/view/widgets/drawer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store store) {
        return HomeScreenViewModel.fromStore(store);
      },
      builder: (BuildContext context, HomeScreenViewModel viewModel) {
        final pagesViewModel = viewModel.pagesViewModel;
        final title = viewModel.title;
        final drawerViewModel = viewModel.drawerViewModel;

        return DefaultTabController(
          length: pagesViewModel.length,
          child: Scaffold(
            drawer: CommonDrawer(
              drawerViewModel: drawerViewModel,
            ),
            appBar: AppBar(
              title: Text(title),
              bottom: TabBar(
                tabs: [
                  ...pagesViewModel.map((pageViewModel) => Tab(
                        icon: pageViewModel.icon,
                        text: pageViewModel.title,
                      )),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ...pagesViewModel.map((pageViewModel) => pageViewModel.page),
              ],
            ),
          ),
        );
      },
    );
  }
}
