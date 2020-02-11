import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/view/widgets/common_drawer.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      body: SafeArea(
        child: NestedScrollView(
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
          body: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(
                seconds: 1,
              ));
              return true;
            },
            child: ListView(
              children: <Widget>[
                CarouselSlider.builder(
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  pauseAutoPlayOnTouch: Duration(),
                  itemCount: 10,
                  viewportFraction: 1.0,
                  itemBuilder: (BuildContext context, int index) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Color.fromARGB(255, Random().nextInt(255),
                              Random().nextInt(255), Random().nextInt(255)),
                          child: Center(
                            child: Text(
                                "this is image / video (slider), $index ..."),
                          ),
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  title: Text("this is title!"),
                  subtitle: Text("this is timestamp!"),
                  isThreeLine: true,
                ),
                Text.rich(
                  TextSpan(
                    text: "this is ",
                    children: <InlineSpan>[
                      TextSpan(
                        text: "Description!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
