// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
  final int valorInicial = 5;
  int contador = 5;

  Timer? _timer;

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

  Future<void> _llamarPolicia(BuildContext context, numeroEmergencia) async {
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
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
              width: 160.0,
              height: 160.0,
              decoration: const BoxDecoration(
                color: Color(0xFFF52800),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        GestureDetector(
          onLongPress: () {
            _llamarPolicia(context, '911');
          },
          child: Text(
            contador.toString(),
            style: const TextStyle(
              fontSize: 50.0,
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}
