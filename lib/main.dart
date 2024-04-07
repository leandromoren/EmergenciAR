import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidar_app/features/pages/widgets/navigation_menubar.dart';
import 'package:vidar_app/utils/functions/colors.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: TColors.navbarBackgroundColor),
      home: const NavigationMenuBar(),
    );
  }
}
