import 'dart:ui';

import 'package:chatroom/constants/constants.dart';
import 'package:flutter/material.dart';

class AppDialogBoxTextField extends StatelessWidget {
  final String hintText;
  final void Function(String) onSubmitted;
  const AppDialogBoxTextField(
      {Key? key, this.hintText = "", required this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print("Dialog");
    return Positioned(
        top: size.height * 0.5 - (size.height * 0.1 * 0.5),
        left: size.width * 0.5 - (size.width * 0.3 * 0.5),
        height: size.height * 0.1,
        width: size.width * 0.3,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Material(
            color: Theme.of(context).canvasColor,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: 5),
                child: Center(
                  child: TextField(
                    onSubmitted: onSubmitted,
                    decoration: InputDecoration(hintText: hintText),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
