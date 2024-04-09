import 'package:flutter/material.dart';
import 'package:vidar_app/utils/functions/colors.dart';

class FarmaciaUbicacion extends StatelessWidget {
  final Function? onMapFunction;
  const FarmaciaUbicacion({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(children: [
        InkWell(
            onTap: () {
              onMapFunction!('Farmacia cerca de mi');
            },
            child: Card(
                color: Color.fromARGB(255, 82, 126, 247),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset('assets/icon/pharmacy.png',
                        height: 32),
                  ),
                ))),
        const Text("Farmacia", style: TextStyle(fontSize: 12))
      ]),
    );
  }
}
