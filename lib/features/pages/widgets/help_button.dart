// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    Key? key,
  }) : super(key: key);

  Future<void> _llamarPolicia(BuildContext context, numeroEmergencia) async {
    try {
      //OBSERVAR SCHEME => TEL, TE => PROBANDO ERROR
      final Uri launchUri = Uri(scheme: 'te', path: numeroEmergencia);
      await launchUrl(launchUri);
    } catch (error) {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Ha ocurrido un error"),
            content: const Text(TTexts.errorLlamarPolicia),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Ok"),
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
          width: 260.0,
          height: 260.0,
          decoration: const BoxDecoration(
            color: Color(0xFFFEDAD3),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 210.0,
          height: 210.0,
          decoration: const BoxDecoration(
            color: Color(0xFFFCBAAD),
            shape: BoxShape.circle,
          ),
        ),
        Center(
          child: GestureDetector(
            onLongPress: () {
              _llamarPolicia(context, '911');
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
            child: const Icon(
              Iconsax.call,
              size: 60.0,
              color: Colors.white,
            )),
      ],
    );
  }
}
