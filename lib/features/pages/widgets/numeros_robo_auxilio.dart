import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vidar_app/utils/constants/styles.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';
import 'package:vidar_app/utils/functions/colors.dart';

class NumerosRoboAuxilio extends StatefulWidget {
  const NumerosRoboAuxilio({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NumerosRoboAuxilioState createState() => _NumerosRoboAuxilioState();
}

class _NumerosRoboAuxilioState extends State<NumerosRoboAuxilio> {
  List<Item> numerosEmergencias = [];

  @override
  void initState() {
    super.initState();
    cargarNumerosEmergencias();
  }

  Future<void> _llamarEmergencia(BuildContext context, String numeroEmergencia) async {
    try {
      final Uri launchUri = Uri(scheme: 'tel', path: numeroEmergencia);
      await launchUrl(launchUri);
    } catch (error) {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(TTexts.tituloMensajeErrorAlLlamarEmergencia),
            content: const Text(TTexts.msjErrorAlLlamarEmergencias),
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

  Future<void> cargarNumerosEmergencias() async {
    const String path = 'assets/jsons/numeros_robo_auxilio.json';
    final jsonString = await rootBundle.loadString(path);
    final parsedJson = jsonDecode(jsonString);
    final emergencias = (parsedJson as List<dynamic>).cast<Map<String, dynamic>>().map((item) {
      final nombre = item['nombre'] != null ? item['nombre'].toString() : 'Sin nombre';
      final numero = item['numero'] != null ? item['numero'].toString() : 'Sin numero';
      final descripcion = item['descripcion'] != null
          ? item['descripcion'].toString()
          : 'Sin descripción';
      return Item(
          expandedValue: numero,
          headerValue: nombre,
          description: descripcion);
    }).toList();
    setState(() {
      numerosEmergencias = emergencias;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: ListTile.divideTiles(
            context: context,
            tiles: numerosEmergencias.map((Item item) {
              return ListTile(
                minVerticalPadding: 20.0,
                title: Text('🔴 ${item.headerValue} 🔹 ${item.expandedValue}', style: titulosListaEmergencias),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(item.description),
                    const SizedBox(height: 10),
                  ],
                ),
                trailing: IconButton(
                  iconSize: 40.0,
                  icon: const Icon(Icons.phone_android, color: TColors.primaryAppColor),
                  onPressed: () => _llamarEmergencia(context, item.expandedValue),
                ),
              );
            }),
          ).toList(),
        ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.description,
  });

  String expandedValue;
  String description;
  String headerValue;
}
