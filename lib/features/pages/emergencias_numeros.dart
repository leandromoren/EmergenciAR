import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmergenciasTEL extends StatelessWidget {
  const EmergenciasTEL({Key? key}) : super(key: key);

  Future<List<Map<String, String>>> cargarNumerosEmergencias() async {
    final jsonString = await rootBundle.loadString('assets/jsons/numeros_mergencias.json');
    final parsedJson = jsonDecode(jsonString);
    final numerosEmergencias =
        (parsedJson as List<dynamic>).cast<Map<String, dynamic>>().map((item) {
      final nombre = item['nombre'].toString();
      final numero = item['numero'].toString();
      return {'nombre': nombre, 'numero': numero};
    }).toList();
    return numerosEmergencias;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: cargarNumerosEmergencias(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Crea la lista de números de emergencias
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final nombre = snapshot.data![index]['nombre'];
              final numero = snapshot.data![index]['numero'];
              return ListTile(
                title: Text(
                  nombre!,
                  style: TextStyle(),
                ),
                subtitle: Text(
                  numero!,
                  style: TextStyle(),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error al cargar datos"),
            );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
