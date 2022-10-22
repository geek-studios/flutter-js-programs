import 'package:chatroom/chat_container.dart';
import 'package:chatroom/controllers/chat_controller.dart';
import 'package:get/get.dart';

import '/constants/constants.dart';

import '/models/user.dart';
import 'package:flutter/material.dart';

import 'user_tile.dart';

class OnlineUsers extends StatelessWidget {
  const OnlineUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xFF222222),
              border: Border(
                  right: BorderSide(color: Theme.of(context).dividerColor))),
          child: const Text(
            "Room Members",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: defaultPadding),
        GetBuilder<ChatController>(
            id: "online_users",
            builder: (controller) {
              return Expanded(
                child: ListView.separated(
                    itemCount: controller.onlineUsers.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: defaultPadding,
                          child: Divider(
                            height: 2,
                          ),
                        ),
                    itemBuilder: (context, index) {
                      User user = controller.onlineUsers[index];
                      return UserTile(user: user);
                    }),
              );
            })
      ],
    );
  }
}
