import 'package:flutter/material.dart';
import 'package:flutter_news/view/widgets/common_drawer.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("This is detail screen"),
            centerTitle: false,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('$index'),
                );
              },
              childCount: 100,
            ),
          ),
//          AppBar(),
        ],
      ),
    );
  }
}
