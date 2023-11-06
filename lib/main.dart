import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vidar_app/pages/auth_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: AuthPage(),
    );
  }
}
