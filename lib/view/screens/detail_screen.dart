import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/main.dart';
import 'package:flutter_news/view/widgets/common_drawer.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<InlineSpan> _buildTextSpan() {
      return <InlineSpan>[
        TextSpan(text: "text span"),
        TextSpan(text: "text span"),
        TextSpan(text: "text span"),
        TextSpan(text: "text span"),
      ];
    }

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
          body: SafeArea(
            child: RefreshIndicator(
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
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.PHOTO_GALLERY_PAGE,
                                // TODO add arguments here
                                arguments: [],
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Color.fromARGB(255, Random().nextInt(255),
                                  Random().nextInt(255), Random().nextInt(255)),
                              child: Center(
                                child: Text(
                                    "this is image / video (slider), $index ..."),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    title: Tooltip(
                      child: Text(
                        "cho thuê căn hộ a, địa chỉ nhà b, tại nhà c!"
                            .toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      message: "cho thuê căn hộ a, địa chỉ nhà b, tại nhà c!",
                    ),
                    subtitle: Tooltip(
                      child: Text(
                        "cho thuê căn hộ a, địa chỉ nhà b, tại nhà c!"
                            .toUpperCase(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                      message: "cho thuê căn hộ a, địa chỉ nhà b, tại nhà c!",
                    ),
                    isThreeLine: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListBody(
                      children: <Widget>[
                        SelectableText.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              ..._buildTextSpan(),
                            ],
                          ),
                        ),
                        Placeholder(
                          color: Colors.cyan,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
