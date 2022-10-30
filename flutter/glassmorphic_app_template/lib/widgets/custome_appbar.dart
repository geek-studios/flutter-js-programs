import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.deepPurple[900]),
      child: AppBar(
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }
}
