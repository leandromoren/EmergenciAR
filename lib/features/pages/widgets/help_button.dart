// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
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

class _HelpButtonState extends State<HelpButton> with TickerProviderStateMixin {
  final int valorInicial = 3;
  int contador = 3;
  late double progreso;

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
          },
          onLongPressUp: () {
            _stopTimer();
            setState(() {
              contador = valorInicial;
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
            },
            onLongPressUp: () {
              _stopTimer();
              setState(() {
                contador = valorInicial;
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
                  lineWidth: 10.0,
                  percent: progreso,
                  backgroundColor: Colors.transparent,
                  progressColor: Colors.white,
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                  //animationDuration: 1000,
                )),
          ),
        ),
        GestureDetector(
          onLongPress: () {
            _startTimer();
          },
          onLongPressUp: () {
            _stopTimer();
            setState(() {
              contador = valorInicial;
            });
          },
          child: Text(
            contador.toString(),
            style: const TextStyle(fontSize: 80.0, color: Colors.white),
          ),
        )
      ],
    );
  }
}
