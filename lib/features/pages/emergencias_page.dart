import 'package:flutter/material.dart';
import 'package:vidar_app/features/pages/widgets/numeros_robo_auxilio.dart';
import 'package:vidar_app/utils/constants/styles.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';

class EmergenciasPage extends StatelessWidget {
  const EmergenciasPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70),
          Text(TTexts.tituloPrincipalEmergencias, style: textoPrincipalEmergenciasPage,),
          SizedBox(height: 20),
          Expanded(child: NumerosRoboAuxilio()),
        ],
      ),
    );
  }
}
