import 'package:flutter/material.dart';
import 'package:vidar_app/utils/functions/colors.dart';

class PoliciaUbicacion extends StatelessWidget {
  final Function? onMapFunction;
  const PoliciaUbicacion({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children:[
          InkWell(
            onTap: () {
              onMapFunction!('Estacion de Policia cerca');
            },
            child: Card(
              color: const Color.fromARGB(255, 0, 0, 0),
              elevation: 
              5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Image.asset('assets/icon/policeman-icon.png', height: 32),
                ),
              )
            )
          ),
          const Text('Policia', style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}