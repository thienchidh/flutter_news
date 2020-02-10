import 'package:flutter/material.dart';
import 'package:flutter_news/model/drawer_model/drawer_model.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:flutter_news/viewmodel/drawer_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => DrawerViewModel.fromStore(store),
      builder: (BuildContext context, DrawerViewModel viewModel) {
        final header = viewModel.header;
        final items = viewModel.items;

        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(header.title),
                accountEmail: Text(header.title),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.people),
                ),
              ),
              ...items.map(
                (DrawerBodyModel item) => ListTile(
                  title: Text(item.title),
                  leading: item.icon,
                  onTap: () async {
                    await Navigator.pushReplacementNamed(
                      context,
                      item.routeName,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
