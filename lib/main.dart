import 'package:flutter/material.dart';
import 'package:vidar_app/features/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VivarApp());
}

class VivarApp extends StatefulWidget {
  const VivarApp({super.key});

  @override
  State<VivarApp> createState() => _VivarAppState();
}

class _VivarAppState extends State<VivarApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}
