import 'package:chatroom/models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(int.parse(user.color)),
        child: Text(user.name.characters.first),
      ),
      title: Text(
        user.name,
        style: const TextStyle(
          fontWeight: FontWeight.w100,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            user.timestamp == null
                ? ""
                : DateFormat('H : mm a').format(user.timestamp!),
            style: const TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
          ),
          if (user.isOnline)
            const CircleAvatar(
              backgroundColor: Colors.green,
              maxRadius: 5,
            )
        ],
      ),
    );
  }
}
