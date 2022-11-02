// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:glassmorphic_app_template/widgets/glassy_appbar.dart';
// import 'package:glassmorphic_app_template/widgets/glassy_navbar.dart';

// class DestinationsPage extends StatelessWidget {
//   const DestinationsPage({super.key});
//   final List destinations = [
//     "Switzerland",
//     "Italy",
//     "Norway",
//     "Finland",
//     "India",
//     "Singapore",
//     "Japan",
//     "China",
//     "USA",
//     "Slovenia",
//     "France",
//     "Germany",
//     "Turkey",
//     "Canada",
//     "Ireland",
//     "Dubai",
//     "Indonesia",
//     "Thailand",
//     "Germany",
//     "Tanzania",
//     "England",
//     "Scotland",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       extendBodyBehindAppBar: true,
//       appBar: GlassyAppBar(title:"Destinations Page"),
//       body: ListView.builder(itemBuilder: itemBuilder),
//     );
//   }
// }

// class ChatContainer extends StatelessWidget {
//   const ChatContainer({required this.chat, super.key});
//   final String chat;
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//         child: BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//       child: Container(
//         height: 50,
//         width: 250,
//         decoration: BoxDecoration(),
//       ),
//     ));
//   }
// }
