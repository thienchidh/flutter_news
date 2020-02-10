import 'package:flutter/material.dart';

class LoadingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class LoadingReached extends StatelessWidget {
  final void Function() onClick;

  const LoadingReached({Key key, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick ?? () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(
              child: Icon(Icons.refresh),
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingError extends StatelessWidget {
  final void Function() onClick;

  final Exception error;

  const LoadingError({Key key, this.onClick, @required this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick ?? () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: ErrorWidget(
                'Please check your internet!\nClick me to retry!\n$error'),
          ),
        ),
      ),
    );
  }
}
