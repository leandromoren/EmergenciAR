import 'package:flutter/material.dart';

class McDonaldsUbicacion extends StatelessWidget {
  final Function? onMapFunction;
  const McDonaldsUbicacion({super.key, this.onMapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(children: [
        InkWell(
            onTap: () {
              onMapFunction!('McDonalds cerca');
            },
            child: Card(
                color: const Color.fromARGB(255, 243, 45, 31),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // ignore: sized_box_for_whitespace
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Image.asset('assets/icon/mcdonalds.png',
                        height: 32),
                  ),
                ))),
        const Text("McDonald's", style: TextStyle(fontSize: 12))
      ]),
    );
  }
}