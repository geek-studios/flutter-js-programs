/*
create class .
connect method
getMessages
close connection
send_message

 */

import 'package:postgresql2/postgresql.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ChatApp {
  late Connection conn;
  Future<void> connectToDb() async {
    var uri = dotenv.env['url'];
    conn = await connect(uri!);
    // debugPrint("connected to the server");
  }

  Future<List<Map>> getmessage(int start) async {
    String query = '';

    if (start > 0) {
      query = "select * from chats where id > $start ";
    } else {
      query = "SELECT * FROM chats order by sendtime desc limit 1";
    }
    List<Row> rows = await conn.query(query).toList();
    List<Map> a = [];
    for (var row in rows) {
      a.add(row.toMap());
    }
    return a;
//2012-02-27 13:27:00
  }

  Future<List<Map>> getonlineusers() async {
    DateTime current = DateTime.now().subtract(const Duration(minutes: 1));
    List<Row> rows = await conn
        .query(
            "select * from onlineusers where onlinetime > '${current.toUtc()}'")
        .toList();
    List<Map> a = [];
    for (var row in rows) {
      a.add(row.toMap());
    }
    return a;
  }

  Future<int> sendMessage(
      String username, String message, String timestamp) async {
    int result = await conn.execute(
        "insert into chats (username,message,sendtime) values('$username','$message','$timestamp')");
    return result;
  }

  Future<int> onlineUsers(
      String username, String timestamp, String color) async {
    List<Row> rows = await conn
        .query("select * from onlineusers where username='$username'")
        .toList();
    if (rows.isEmpty) {
      return await conn.execute(
          "insert into onlineusers(username,onlinetime,color) values('$username','$timestamp','$color')");
    }

    return conn.execute(
        "UPDATE onlineusers SET onlinetime='$timestamp'  WHERE username='$username';");
  }

  void closeConnection() {
    conn.close();
  }
}

void main() async {
  ChatApp app = ChatApp();

  await app.connectToDb();
  await app.getonlineusers();
  // await app.conn.execute("delete from chats");
  // await app.conn.execute("delete from onlineusers");
  // await app.conn.execute("drop table onlineusers");
  //await app.conn.execute("delete from chats");
  //await app.sendMessage("Paul ", "show vendaa", DateTime.now().toString());

  // List<Row> rows = await app.conn.query("select * from chats").toList();
  // print(rows);
  // await app.conn.execute(
  //     "create table onlineusers (id serial primary key,username text,color text, onlinetime timestamp with time zone)");

  // await app.conn
  //     .execute("create table onlineusers(username text,timestamp timestamp)");
  // await app.onlineUsers("Vinu", DateTime.now().toString());
  // await app.getonlineusers();
  // await app.getmessage(0);
  app.closeConnection();
}
