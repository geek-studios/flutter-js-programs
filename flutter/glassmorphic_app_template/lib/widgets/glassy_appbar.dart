import 'dart:ui';

import 'package:flutter/material.dart';

class GlassyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlassyAppBar({required this.title, super.key});
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            image: const DecorationImage(
                opacity: 0.1,
                image: AssetImage(
                  "assets/images/noisy-background_1194-7547 (1).jpg",
                ),
                fit: BoxFit.cover),
            border: const Border(bottom: BorderSide(color: Colors.white60)),
            color: Colors.white.withOpacity(0.3),
            gradient: const LinearGradient(
                colors: [Colors.white, Colors.white38],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
