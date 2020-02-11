import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  final Icon animatedIcon;
  final List<FloatingActionButton> actions;

  const AnimatedFab({
    Key key,
    @required this.actions,
    this.animatedIcon,
  }) : super(key: key);

  @override
  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addListener(() {
        setState(() {});
      });
    _animateIcon = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {
    int _i = widget.actions.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ...widget.actions.map((child) {
          return Transform(
            transform: Matrix4.translationValues(
              0.0,
              _translateButton.value * _i--,
              0.0,
            ),
            child: child,
          );
        }),
        FloatingActionButton(
          backgroundColor: _buttonColor.value,
          onPressed: animate,
          tooltip: 'Toggle',
          child: AnimatedIcon(
            icon: widget.animatedIcon ?? AnimatedIcons.menu_close,
            progress: _animateIcon,
          ),
        ),
      ],
    );
  }
}
