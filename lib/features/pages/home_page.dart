import 'package:flutter/material.dart';
import 'package:vidar_app/features/pages/widgets/navigation_menubar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Stack(
        children: [
          NavigationMenuBar()
          ]
        )
    );
  }
}