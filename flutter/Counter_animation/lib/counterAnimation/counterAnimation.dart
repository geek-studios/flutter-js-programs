import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  final String count;

  const CounterAnimation({Key key, this.count}) : super(key: key);
  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  String tempCount;
  bool isChangeCount = false;
  @override
  void initState() {
    super.initState();
    tempCount = widget.count;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..addListener(() {
        this.setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed && isChangeCount) {
          tempCount = widget.count;
          _controller.reset();
          _controller.forward();
          isChangeCount = false;
        }
      });
    _animation = Tween<double>(begin: 0.0, end: 60.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CounterAnimation oldWidget) {
    if (oldWidget.count != widget.count) {
      isChangeCount = true;
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double bottom = 0, top = 0;
    if (tempCount != widget.count) {
      bottom = _animation.value;
    } else {
      top = 60 - _animation.value;
    }
    return Container(
      height: 60,
      width: 30.0,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20.0, top: top, bottom: bottom),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          border: Border.all(color: Colors.green, width: 2.0)),
      child: Text("$tempCount",
          style: TextStyle(color: Colors.white, fontSize: 30)),
    );
  }
}
