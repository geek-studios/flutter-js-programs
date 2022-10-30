import 'package:flutter/material.dart';
import 'package:glassmorphic_app_template/screens/settings_page.dart';

import '../screens/home_page.dart';

class GlassyNavBar extends StatefulWidget {
  const GlassyNavBar({super.key});

  @override
  State<GlassyNavBar> createState() => _GlassyNavBarState();
}

class _GlassyNavBarState extends State<GlassyNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(_createRoute(0));
          },
          child: const Icon(Icons.home),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(_createRoute(1));
          },
          child: const Icon(Icons.settings),
        )
      ]),
    );
  }
}

Route _createRoute(int page) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
    if (page == 0) {
      return HomePage();
    }
    if (page == 1) {
      return SettingsPage();
    }
    return HomePage();
  }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return child;
  });
}
