// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vidar_app/features/pages/widgets/compartir_ubicacion.dart';
import 'package:vidar_app/features/pages/widgets/help_button.dart';
import 'package:vidar_app/features/pages/widgets/sugerencias_home.dart';
import 'package:vidar_app/utils/constants/styles.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';
import 'package:vidar_app/utils/functions/colors.dart';
import 'package:vidar_app/utils/functions/helper_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<String> sugerencias = [
    'Mantén la atención en tu entorno: Estate atento/a a lo que sucede a tu alrededor y evita distraerte con dispositivos electrónicos.',
    'Evita mostrar objetos de valor: No exhibas joyas costosas, dispositivos electrónicos caros u otros objetos valiosos en público.',
    'Camina por áreas bien iluminadas: Elige rutas que estén bien iluminadas y transitadas por otras personas.',
    'Utiliza servicios de transporte confiables: Al utilizar taxis o aplicaciones de transporte compartido, elige proveedores confiables y comparte los detalles del viaje con alguien de confianza',
    'Confía en tu instinto: Si algo te parece sospechoso o inseguro, confía en tu instinto y busca un entorno más seguro.',
    'Mantén tus pertenencias seguras: Mantén tus pertenencias cerca de ti y evita dejarlas desatendidas en lugares públicos.',
    'Conoce las rutas de emergencia: Familiarízate con las rutas de emergencia y los lugares seguros en tu área.',
    'Utiliza el transporte público seguro: Utiliza sistemas de transporte público reconocidos y mantente alerta en estaciones y paradas.',
    'Informa a alguien sobre tus planes: Antes de salir, informa a alguien de confianza sobre tus planes y cuándo esperas regresar.',
    'Mantén un teléfono móvil cargado y con saldo: Asegúrate de tener un teléfono móvil con suficiente carga y saldo para realizar llamadas en caso de emergencia.'
  ];
  int indiceSugerenciaActual = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animationController.repeat(reverse: true);
    cambiarSugerencias();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void cambiarSugerencias() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        indiceSugerenciaActual =
            (indiceSugerenciaActual + 1) % sugerencias.length;
      });
      cambiarSugerencias();
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkMode ? TColors.dark : Colors.white,
          foregroundColor: darkMode ? TColors.light : Colors.black,
          title: Text(
            'Inicio',
            style: kAppBarText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CompartirUbicacion(),
              Container(
                height: 120,
                child: Sugerencias(
                    animacion: _animationController,
                    textos: sugerencias,
                    indice: indiceSugerenciaActual),
              ),
              Container(
                width: 200,
                child: Text(
                  TTexts.tituloSecundarioHome,
                  textAlign: TextAlign.center,
                  style: textoSecundarioHomePage,
                  textDirection: TextDirection.ltr,
                ),
              ),
              HelpButton(key: null),
            ],
          ),
        ),
      ),
    );
  }
}
