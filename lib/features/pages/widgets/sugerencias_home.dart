import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:vidar_app/utils/constants/styles.dart';

class Sugerencias extends StatefulWidget {

  const Sugerencias({super.key});

  @override
  State<Sugerencias> createState() => _SugerenciasState();
}

class _SugerenciasState extends State<Sugerencias> with SingleTickerProviderStateMixin {

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
 
  late AnimationController animacion;
  late Timer _timer;
  int _indice = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      setState(() {
        _indice = (_indice + 1) % sugerencias.length;
      });
    });
    animacion = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animacion.repeat(reverse: false);
    cambiarSugerencias();
  }

  void cambiarSugerencias() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _indice =
            (_indice + 1) % sugerencias.length;
      });
    });
  }

  @override
  void dispose() {
    animacion.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeIn(
        animate: true,
        duration: const Duration(seconds: 1),
        child: AnimatedTextKit(
          key: ValueKey<int>(_indice),
          animatedTexts: [
            ColorizeAnimatedText(
              '🛡️ ${sugerencias[_indice]}',
              textStyle: textoSugerencias,
              textAlign: TextAlign.center,
              speed: const Duration(milliseconds: 200),
              colors: colorizeColors,
            ),
          ],
        ),
      ),
    );
  }
}
