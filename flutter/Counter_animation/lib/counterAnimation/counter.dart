import 'dart:async';

import 'package:flutter/material.dart';

import 'counterAnimation.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  Timer _timer;
  int count = 1000;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      this.setState(() {
        count++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: 180,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Counter Aniamtion",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
                Text(
                  "By Naighu/AndroCodoHacks",
                  style: TextStyle(color: Colors.orange, fontSize: 20.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                    constraints: BoxConstraints(maxHeight: 60.0),
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            count.toString().split("").length, (index) {
                          return CounterAnimation(
                              count:
                                  count.toString().substring(index, index + 1));
                        }))),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ));
  }
}
