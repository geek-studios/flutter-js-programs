import 'dart:ui';

import 'package:chatroom/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoadingDialogbox extends StatelessWidget {
  final String text;
  final bool showloading;
  const LoadingDialogbox(
      {Key? key, required this.text, this.showloading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
          child: SizedBox(
            height: size.height * 0.07,
            width: size.width * 0.32,
            child: Material(
              color: Theme.of(context).canvasColor,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding, vertical: 5),
                  child: Center(
                      child: Row(
                    children: [
                      if (showloading) const CircularProgressIndicator(),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Text(
                        text,
                        style: const TextStyle(fontWeight: FontWeight.w200),
                      )
                    ],
                  )),
                ),
              ),
            ),
          ),
        ));
  }
}
