import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '/chat_container.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chat Room DB',
        theme: ThemeData(
            brightness: Brightness.dark,
            canvasColor: const Color(0xFF222222),
            scaffoldBackgroundColor: const Color(0xFF090e11),
            primarySwatch: Colors.blue,
            dividerColor: const Color(0xFF30383d),
            inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                hintStyle: TextStyle(fontWeight: FontWeight.w100),
                contentPadding: EdgeInsets.only(top: 5, left: 20),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                fillColor: Color(0xFF33383B))),
        home: Scaffold(
            backgroundColor: const Color(0xFF090e11),
            body: Stack(
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return Image.asset("assets/images/background.jpg",
                      fit: BoxFit.cover,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth);
                }),
                const ChatContainer(),
              ],
            )));
  }
}
