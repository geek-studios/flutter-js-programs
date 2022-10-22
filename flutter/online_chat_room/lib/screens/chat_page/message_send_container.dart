import 'package:chatroom/constants/constants.dart';
import 'package:chatroom/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class MessageSendContainer extends StatefulWidget {
  const MessageSendContainer({Key? key}) : super(key: key);

  @override
  State<MessageSendContainer> createState() => _MessageSendContainerState();
}

class _MessageSendContainerState extends State<MessageSendContainer> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      color: Theme.of(context).canvasColor,
      child: Row(
        children: [
          const Icon(Icons.message),
          const SizedBox(width: defaultPadding),
          Expanded(
            child: TextField(
                controller: _controller,
                style: const TextStyle(fontWeight: FontWeight.w100),
                onSubmitted: (String value) {
                  Get.find<ChatController>().sendMessage(value);
                  _controller.clear();
                },
                decoration: const InputDecoration(
                  hintText: "Enter your message here ...",
                )),
          )
        ],
      ),
    );
  }
}
