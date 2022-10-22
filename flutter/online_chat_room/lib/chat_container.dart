import 'package:chatroom/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/chat_page/chat_page.dart';
import 'screens/online_users/online_users.dart';

class ChatContainer extends StatefulWidget {
  const ChatContainer({Key? key}) : super(key: key);

  @override
  State<ChatContainer> createState() => _ChatContainerState();
}

class _ChatContainerState extends State<ChatContainer> {
  @override
  void initState() {
    super.initState();
    Get.put(ChatController(context));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: constraints.maxHeight > 700
                  ? constraints.maxHeight * 0.1
                  : 0.0,
              horizontal: constraints.maxWidth > 1200
                  ? constraints.maxWidth * 0.2
                  : 0.0),
          child: Row(
            children: [
              //online Users
              Container(
                  color: const Color(0xFF161616),
                  height: constraints.maxHeight,
                  width: constraints.maxWidth > 1200
                      ? constraints.maxWidth * 0.18
                      : constraints.maxWidth > 700 &&
                              constraints.maxWidth < 1200
                          ? constraints.maxWidth * 0.3
                          : constraints.maxWidth * 0.5,
                  child: const OnlineUsers()),

              //Global Chat
              const Expanded(child: ChatPage())
            ],
          ),
        ),
      );
    });
  }
}
