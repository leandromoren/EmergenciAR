import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumerosRoboAuxilio extends StatefulWidget {
  const NumerosRoboAuxilio({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NumerosRoboAuxilioState createState() => _NumerosRoboAuxilioState();
}

class _NumerosRoboAuxilioState extends State<NumerosRoboAuxilio> {
  List<Item> numerosEmergencias = [];
  final List<Item> _data = generateItems(8);

  @override
  void initState() {
    super.initState();
    cargarNumerosEmergencias();
  }

  Future<void> cargarNumerosEmergencias() async {
    final jsonString =
        await rootBundle.loadString('assets/jsons/numeros_robo_auxilio.json');
    final parsedJson = jsonDecode(jsonString);
    final emergencias =
        (parsedJson as List<dynamic>).cast<Map<String, dynamic>>().map((item) {
      final nombre = item['nombre'].toString();
      final numero = item['numero'].toString();
      return Item(expandedValue: numero, headerValue: nombre, isExpanded: false);
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
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          numerosEmergencias[index].isExpanded =  isExpanded;
        });
      },
      children: numerosEmergencias.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.call),
              onTap: () {
                setState(() {
                  numerosEmergencias.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
