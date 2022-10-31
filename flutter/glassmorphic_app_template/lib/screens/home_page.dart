import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphic_app_template/widgets/glassy_appbar.dart';
import 'package:glassmorphic_app_template/widgets/glassy_container.dart';
import 'package:glassmorphic_app_template/widgets/glassy_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String image =
      "https://freepngimg.com/download/water_drops/29328-6-water-drops-transparent-background.png";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: const GlassyAppBar(title: 'Home'),
      bottomNavigationBar: const GlassyNavBar(
        selectedIndex: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                'assets/images/44b208e04a532e7077071d32baebf666.jpeg'),
          ),
        ),
        child: Center(
          child: GlassyContainer(
            text: "Focus on the \nJOURNEY,\nnot the destination!",
            onPressed: () {
              showSheet(context);
            },
          ),
        ),
      ),
    );
  }
}

showSheet(BuildContext context) {
  showModalBottomSheet<void>(
      elevation: 0,
      backgroundColor: Colors.transparent,
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                border: Border(top: BorderSide(color: Colors.white, width: 2)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                gradient: const LinearGradient(
                    colors: [Colors.white60, Colors.white10],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomRight),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/images/noisy-background_1194-7547 (1).jpg"),
                  opacity: 0.1,
                  // colorFilter:
                  //     ColorFilter.mode(Colors.white10, BlendMode.dstATop),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      blurRadius: 25,
                      spreadRadius: 0)
                ],
              ),
              child: SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Bottom Model Sheet",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
