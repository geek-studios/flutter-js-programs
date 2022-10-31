import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphic_app_template/screens/settings_page.dart';

import '../screens/home_page.dart';

class GlassyNavBar extends StatefulWidget {
  final int selectedIndex;
  const GlassyNavBar({required this.selectedIndex, super.key});

  @override
  State<GlassyNavBar> createState() => _GlassyNavBarState();
}

class _GlassyNavBarState extends State<GlassyNavBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          height: 56,
          width: size.width,
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/images/noisy-background_1194-7547 (1).jpg"),
              opacity: 0.1,
              //colorFilter: ColorFilter.mode(Colors.white12, BlendMode.dstATop),
            ),
            gradient: LinearGradient(
              begin: widget.selectedIndex == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              end: widget.selectedIndex == 0
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              colors: const [Colors.white60, Colors.white24],
            ),
            //borderRadius: BorderRadius.circular(25),
            border: const Border(top: BorderSide(color: Colors.white60)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 25,
                  spreadRadius: -5)
            ],
          ),
          child: Center(
            child: BottomAppBar(
              elevation: 0,
              color: Colors.transparent,
              child: SizedBox(
                height: 56,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconBottomBar(
                          icon: Icons.home_outlined,
                          selected: widget.selectedIndex == 0,
                          onPressed: () {
                            Navigator.of(context).push(_createRoute(0));
                          }),
                      IconBottomBar(
                          icon: Icons.settings,
                          selected: widget.selectedIndex == 1,
                          onPressed: () {
                            Navigator.of(context).push(_createRoute(1));
                          }),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function()? onPressed;
  const IconBottomBar(
      {required this.icon,
      required this.selected,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        color: selected ? Colors.black : Colors.black45,
      ),
    );
  }
}

Route _createRoute(int page) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
    if (page == 0) {
      return const HomePage();
    }
    if (page == 1) {
      return const SettingsPage();
    }
    return const HomePage();
  }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return child;
  });
}
