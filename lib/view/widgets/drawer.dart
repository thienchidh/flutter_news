import 'package:flutter/material.dart';
import 'package:flutter_news/model/DrawerModel.dart';
import 'package:flutter_news/viewmodel/drawer_viewmodel.dart';

class CommonDrawer extends StatelessWidget {
  final DrawerViewModel drawerViewModel;

  const CommonDrawer({Key key, this.drawerViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final header = drawerViewModel.header;
    final items = drawerViewModel.items;

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
//                  (route) => !route.navigator.canPop(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
