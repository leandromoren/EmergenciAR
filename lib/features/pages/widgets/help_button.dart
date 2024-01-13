// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';

class HelpButton extends StatefulWidget {
  const HelpButton({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HelpButtonState createState() => _HelpButtonState();
}

class _HelpButtonState extends State<HelpButton> {
  final int valorInicial = 4;
  int contador = 4;
  late double progreso;
  bool mostrarContador = true;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        contador--;
      });
      if (contador < 0) {
        _llamarPolicia(context, '911');
        _stopTimer();
        contador = valorInicial;
      }
      if (contador == 4) {
        mostrarContador = true;
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  Future<void> _llamarPolicia(
      BuildContext context, String numeroEmergencia) async {
    try {
      //OBSERVAR SCHEME => TEL, TE => PROBANDO ERROR
      final Uri launchUri = Uri(scheme: 'tel', path: numeroEmergencia);
      await launchUrl(launchUri);
    } catch (error) {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error al llamar emergencia."),
            content: const Text(TTexts.errorLlamarPolicia),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Aceptar"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    progreso = 1 - (contador / valorInicial);

    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onLongPress: () {
            _startTimer();
            mostrarContador = false;
          },
          onLongPressUp: () {
            _stopTimer();
            setState(() {
              contador = valorInicial;
              mostrarContador = true;
            });
          },
          child: Container(
            width: 210.0,
            height: 210.0,
            decoration: BoxDecoration(
                color: const Color(0xFFF52800),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.55),
                      blurRadius: 8.0,
                      offset: Offset.zero)
                ]),
          ),
        ),
        Center(
          child: GestureDetector(
            onLongPress: () {
              _startTimer();
              mostrarContador = false;
            },
            onLongPressUp: () {
              _stopTimer();
              setState(() {
                contador = valorInicial;
                mostrarContador = true;
              });
            },
            child: Container(
                width: 20.0,
                height: 220.0,
                decoration: const BoxDecoration(
                  color: Color(0xFFF52800),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.topCenter,
                child: CircularPercentIndicator(
                  radius: 110.0,
                  lineWidth: 5.0,
                  percent: progreso,
                  backgroundColor: Colors.transparent,
                  progressColor: Colors.white,
                  circularStrokeCap: CircularStrokeCap.square,
                  animation: false,
                )),
          ),
        ),
        GestureDetector(
          onLongPress: () {
            _startTimer();
            mostrarContador = false;
          },
          onLongPressUp: () {
            _stopTimer();
            setState(() {
              contador = valorInicial;
              mostrarContador = true;
            });
          },
          child: mostrarContador
              ? const Icon(
                  Iconsax.radar_1,
                  color: Colors.white,
                  size: 120.0,
                )
              : Text(
                  contador.toString(),
                  style: const TextStyle(fontSize: 80.0, color: Colors.white),
                ),
        ),
        Container(
            alignment: Alignment.topCenter,
            height: 100,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 85.0),
                  if (!mostrarContador)
                    const Text(
                      'Suelta para cancelar',
                      style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                ]))
      ],
    );
  }
}
