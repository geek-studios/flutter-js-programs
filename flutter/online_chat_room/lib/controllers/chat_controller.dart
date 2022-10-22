import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:chatroom/backend/server.dart';
import 'package:chatroom/models/chat.dart';
import 'package:chatroom/models/user.dart';
import 'package:chatroom/widget_utils/dialogbox_textfield.dart';
import 'package:chatroom/widget_utils/loading_dialogbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  late String username, color;
  RxList<Chat> chats = <Chat>[].obs;
  List<User> onlineUsers = [];
  final File _userFile = File(".user.txt");
  late ChatApp db;
  BuildContext context;
  ChatController(this.context);
  @override
  void onInit() async {
    super.onInit();

    try {
      if (!_userFile.existsSync()) {
        displayTextField(context);
      } else {
        username = _userFile.readAsStringSync().split("\n")[0];
        color = _userFile.readAsStringSync().split("\n")[1];

        db = ChatApp();
        await db.connectToDb();

        sendOnlineRequest();
        getNewMessages();
        getOnlineUsers();
        update();
      }
    } catch (e) {
      _errorHandler(e);
    }
  }

  void getNewMessages({Duration duration = const Duration(seconds: 3)}) async {
    int _track = 0;
    while (true) {
      try {
        List<Map> messages = await db.getmessage(_track);

        for (Map element in messages) {
          chats.insert(0, Chat.fromJson(element));
        }

        if (messages.isNotEmpty) _track = chats.first.id;
      } catch (e) {
        _errorHandler(e);
      }

      await Future.delayed(duration);
    }
  }

  void getOnlineUsers({Duration duration = const Duration(seconds: 5)}) async {
    while (true) {
      try {
        List<Map> users = await db.getonlineusers();

        for (var element in users) {
          int index = isUserPresent(element["username"]);

          if (index != -1) {
            onlineUsers[index].timestamp = element["onlinetime"].toUtc();
            onlineUsers[index].isOnline =
                DateTime.now().difference(onlineUsers[index].timestamp!) >
                    const Duration(minutes: 2);
          } else {
            onlineUsers.add(User.fromJson(
                element,
                DateTime.now().difference(element["onlinetime"].toUtc()) >
                    const Duration(minutes: 2)));
          }
          update(["online_users"]);
        }
      } catch (e) {
        _errorHandler(e);
      }
      //
      await Future.delayed(duration);
    }
  }

  int isUserPresent(String username) {
    for (int i = 0; i < onlineUsers.length; i++) {
      if (onlineUsers[i].name == username) {
        return i;
      }
    }
    return -1;
  }

  void sendMessage(String message) {
    late OverlayEntry entry;

    entry = OverlayEntry(
        builder: (context) => const LoadingDialogbox(
              text: "Sending message....",
            ));

    Overlay.of(context)!.insert(entry);
    db
        .sendMessage(username, message, DateTime.now().toString())
        .then((value) async {
      await Future.delayed(const Duration(seconds: 2));
      entry.remove();
    }).catchError(_errorHandler);
  }

  void sendOnlineRequest(
      {Duration duration = const Duration(minutes: 1)}) async {
    while (true) {
      try {
        await db.onlineUsers(username, DateTime.now().toString(), color);
      } catch (e) {
        _errorHandler(e);
      }
      await Future.delayed(duration);
    }
  }

  FutureOr<Null> _errorHandler(Object e) async {
    late OverlayEntry entry;

    entry = OverlayEntry(
        builder: (context) => LoadingDialogbox(
              text: e.toString(),
              showloading: false,
            ));
    Overlay.of(context)!.insert(entry);
    await Future.delayed(const Duration(seconds: 4));
    entry.remove();
  }

  void displayTextField(BuildContext context) {
    late OverlayEntry entry;

    entry = OverlayEntry(
        builder: (context) => AppDialogBoxTextField(
              hintText: "Choose a username",
              onSubmitted: (String user) {
                entry.remove();
                _saveUsername(user);
              },
            ));
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Overlay.of(context)!.insert(entry);
    });
  }

  void _saveUsername(String username) {
    const List<String> _colors = [
      "0xfff44336",
      "0xff4caf50",
      "0xffffeb3b",
      "0xffe91e63",
      "0xffff9800"
    ];
    color = _colors[Random().nextInt(_colors.length)];
    _userFile.writeAsStringSync(username + "\n" + color);
    onInit();
  }

  @override
  void dispose() {
    super.dispose();

    db.closeConnection();
  }
}
