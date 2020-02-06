import 'package:flutter/material.dart';

class LoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LinearProgressIndicator(),
    );
  }
}

class LoadingReached extends StatelessWidget {
  final Function() onClick;

  const LoadingReached({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LoadingError extends StatelessWidget {
  final Function() onClick;

  const LoadingError({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
