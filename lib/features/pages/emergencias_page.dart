import 'package:flutter/material.dart';
import 'package:vidar_app/features/pages/widgets/numeros_robo_auxilio.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';

class EmergenciasPage extends StatelessWidget {
  const EmergenciasPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Text(TTexts.tituloPrincipalEmergencias),
          SizedBox(height: 50),
          Expanded(child: NumerosRoboAuxilio()),
        ],
      ),
    );
  }
}
