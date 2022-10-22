import 'dart:math';

import 'package:flutter/material.dart';

class User {
  final String name;
  DateTime? timestamp;
  bool isOnline;

  final String color;

  User(
      {required this.name,
      this.timestamp,
      required this.isOnline,
      required this.color});
  factory User.fromJson(Map json, bool isOnline) {
    DateTime t = json["onlinetime"].toUtc();
    print(t);
    return User(
        name: json["username"],
        timestamp: t,
        color: json["color"],
        isOnline: isOnline);
  }
}
