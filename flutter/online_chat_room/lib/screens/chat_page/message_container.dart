import 'package:chatroom/constants/constants.dart';
import 'package:chatroom/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'arrow_corner.dart';

class MessageContainer extends StatelessWidget {
  final Chat chat;
  final String color;
  const MessageContainer({Key? key, required this.chat, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.user,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(
                      int.parse(color.startsWith("0x") ? color : "0xFF$color")),
                ),
              ),
              const SizedBox(width: defaultPadding),
              Flexible(
                child: Container(
                  constraints:
                      BoxConstraints(maxWidth: constraints.maxWidth * 0.65),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.cyan[900],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    chat.message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi / 30),
                  child: CustomPaint(painter: CustomShape(Colors.cyan[900]!))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                chat.timestamp == null
                    ? ""
                    : DateFormat('H : mm a').format(chat.timestamp!),
                style:
                    const TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
              ),
            ),
          )
        ],
      );
    });
  }
}
