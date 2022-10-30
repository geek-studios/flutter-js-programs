import 'dart:ui';

import 'package:flutter/material.dart';

class GlassyContainer extends StatelessWidget {
  final String text;
  const GlassyContainer({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      //BorderRadius.only(
      //     topLeft: Radius.circular(75), bottomRight: Radius.circular(75)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: 150,
          width: 300,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/images/noisy-background_1194-7547 (1).jpg"),
              opacity: 0.2,
              colorFilter: ColorFilter.mode(Colors.white10, BlendMode.dstATop),
            ),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.white60, Colors.white10]),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 25,
                  spreadRadius: -5)
            ],
          ),
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Container(
                  height: 150,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/29328-6-water-drops-transparent-background.png"),
                      opacity: 0.99,
                      colorFilter: const ColorFilter.mode(
                          Colors.black26, BlendMode.dstATop),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
