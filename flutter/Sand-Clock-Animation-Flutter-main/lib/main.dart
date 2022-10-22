import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'sand_clock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sand Clock Animation',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  Animation<double> rotateAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0.0, end: 0.10).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.0,
        0.8,
        curve: Curves.ease,
      ),
    ));
    rotateAnimation =
        Tween<double>(begin: 0.0, end: 180.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.8,
        1.0,
        curve: Curves.ease,
      ),
    ));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        this.setState(() {
          controller.reset();
          controller.forward();
        });
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333232),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sand Clock Animation ",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Text("Made by Naighu/AndroCodeHacks",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold)),
            Container(
                width: 300,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Transform.rotate(
                  angle: (rotateAnimation.value * math.pi) / 180,
                  child: CustomPaint(
                    size: Size(500, 500),
                    painter: SandClock(value: animation.value),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
