import 'package:chatroom/constants/constants.dart';
import 'package:chatroom/controllers/chat_controller.dart';
import 'package:chatroom/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'message_container.dart';
import 'message_send_container.dart';

// List<Chat> chats = [
//   Chat(id: 1, message: "Hello", user: "Naigal Roy", timestamp: DateTime.now()),
//   Chat(id: 1, message: "Hai", user: "Vinayak N", timestamp: DateTime.now()),
//   Chat(
//       id: 1,
//       message: "Whats up everyone..paul show here",
//       user: "Paul P",
//       timestamp: DateTime.now()),
//   Chat(
//       id: 1,
//       message: "Hai i am neeraj ",
//       user: "Neeraj Vinod",
//       timestamp: DateTime.now()),
//   Chat(id: 1, message: "Hello", user: "Naigal Roy", timestamp: DateTime.now()),
//   Chat(id: 1, message: "Hai", user: "Vinayak N", timestamp: DateTime.now()),
//   Chat(
//       id: 1,
//       message: "Whats up everyone..paul show here",
//       user: "Paul P",
//       timestamp: DateTime.now()),
//   Chat(
//       id: 1,
//       message: "Hai i am neeraj ",
//       user: "Neeraj",
//       timestamp: DateTime.now()),
//   Chat(id: 1, message: "Hello", user: "Naigal Roy", timestamp: DateTime.now()),
//   Chat(id: 1, message: "Hai", user: "Vinayak N", timestamp: DateTime.now()),
//   Chat(
//       id: 1,
//       message: "Whats up everyone..paul show here",
//       user: "Paul P",
//       timestamp: DateTime.now()),
//   Chat(
//       id: 1,
//       message: "Hai i am neeraj ",
//       user: "Neeraj",
//       timestamp: DateTime.now()),
// ];

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      LayoutBuilder(builder: (context, constraints) {
        return Image.asset(
          "assets/images/chat_background.png",
          fit: BoxFit.cover,
          height: constraints.maxHeight,
          width: constraints.maxWidth,
        );
      }),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Container(
          width: double.infinity,
          height: 40,
          color: const Color(0xFF222222),
          alignment: Alignment.center,
          child: const Text(
            "Chat Room ",
            style: TextStyle(fontSize: 20),
          ),
        ),
        GetX<ChatController>(builder: (controller) {
          return Flexible(
              child: ListView.separated(
                  reverse: true,
                  controller: ScrollController(),
                  separatorBuilder: (__, _) => const SizedBox(
                        height: defaultPadding,
                      ),
                  itemCount: controller.chats.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding:
                            const EdgeInsets.only(right: defaultPadding * 1.7),
                        child: MessageContainer(
                          chat: controller.chats[index],
                          color: getColor(controller.chats[index].user),
                        ));
                  }));
        }),
        const Align(
            alignment: Alignment.bottomCenter, child: MessageSendContainer()),
      ]),
    ]);
  }

  String getColor(String username) {
    final ChatController controller = Get.find<ChatController>();
    for (User user in controller.onlineUsers) {
      if (user.name == username) {
        return user.color;
      }
    }
    return "FFFFFF";
  }
}
