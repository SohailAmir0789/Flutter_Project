import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "home"),
        NavigationDestination(icon: Icon(Icons.home), label: "home"),
        NavigationDestination(icon: Icon(Icons.home), label: "home"),
        NavigationDestination(icon: Icon(Icons.home), label: "home"),
      ]),
    );
  }
}
