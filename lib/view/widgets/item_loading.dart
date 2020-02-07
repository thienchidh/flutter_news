import 'package:flutter/material.dart';

class LoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      child: Container(
        height: screenHeight / 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
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

  final Error error;

  const LoadingError({Key key, this.onClick, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
