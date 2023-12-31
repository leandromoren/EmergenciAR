// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';
import 'package:vidar_app/utils/functions/helper_functions.dart';

import '../../utils/functions/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _progress = 0.0;
  bool _call911 = false;

  void _startProgress() {
    setState(() {
      _progress = 0.0;
    });

    // Simula el progreso de llenado de la barra durante 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _progress = 1.0;
        _call911 = true;
      });

      // Realiza la llamada al 911
      if (_call911) {
        _make911Call();
      }
    });
  }

  void _make911Call() {
    // Aquí puedes implementar la lógica para realizar la llamada al 911
    // Puedes usar paquetes como `flutter_phone_state` para facilitar esta tarea
    // Asegúrate de solicitar los permisos necesarios para realizar llamadas en el archivo `AndroidManifest.xml` (Android) o `Info.plist` (iOS)
    // Ten en cuenta que esta es solo una implementación simulada
    print('Llamando al 911...');
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkMode ? TColors.dark : Colors.white,
        foregroundColor: darkMode ? TColors.light : Colors.black,
        title: const Text('Inicio'),
      ),
      body: Container(
        width: 80.0,
        height: 80.0,
        child: InkWell(
    onTap: () {
      _startProgress();
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: _progress,
          strokeWidth: 6.0,
        ),
        Icon(
          Icons.play_arrow,
          size: 40.0,
        ),
      ],
    ),
  ),
      ),
    );
  }
}
