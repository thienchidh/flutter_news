import 'package:flutter/material.dart';
import 'package:flutter_news/view/widgets/common_drawer.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (_, __) {
          return <Widget>[
            SliverAppBar(
              title: Text("this is appbar!"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
              floating: true,
              centerTitle: false,
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.orange,
                child: Center(
                  child: Text("this is image / video, ..."),
                ),
              ),
            ),
            ListTile(
              title: Text("this is title!"),
              subtitle: Text("this is timestamp!"),
              trailing: Text("this is place!"),
            ),
          ],
        ),
      ),
    );
  }
}
