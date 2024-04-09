import 'package:flutter/material.dart';
import 'package:vidar_app/utils/functions/colors.dart';

class HospitalUbicacion extends StatelessWidget {
  final Function? onMapFunction;
  const HospitalUbicacion({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children:[
          InkWell(
            onTap: () {
              onMapFunction!('Hospital cerca');
            },
            child: Card(
              color: const Color.fromARGB(255, 0, 255, 153),
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
                  child: Image.asset('assets/icon/hospital.png', height: 32),
                ),
              )
            )
          ),
          const Text('Hospital', style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}