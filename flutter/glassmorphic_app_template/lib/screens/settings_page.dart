import 'package:flutter/material.dart';

import '../widgets/glassy_appbar.dart';
import '../widgets/glassy_container.dart';
import '../widgets/glassy_navbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: const GlassyAppBar(title: 'Settings'),
      bottomNavigationBar: const GlassyNavBar(
        selectedIndex: 1,
      ),
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                'assets/images/44b208e04a532e7077071d32baebf666.jpeg'),
          ),
        ),
        child: const Center(
          child: GlassyContainer(text: "Settings Page"),
        ),
      ),
    );
  }
}
