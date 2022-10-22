class Chat {
  final String user, message;
  int id;
  final DateTime? timestamp;

  Chat(
      {required this.id,
      required this.user,
      this.timestamp,
      required this.message});

  factory Chat.fromJson(Map json) {
    DateTime t = json["sendtime"].toUtc();
    return Chat(
        id: json["id"],
        user: json["username"],
        timestamp: t,
        message: json["message"]);
  }
}
