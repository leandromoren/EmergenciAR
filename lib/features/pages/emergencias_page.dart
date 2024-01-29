import 'package:flutter/material.dart';
import 'package:vidar_app/features/pages/widgets/numeros_robo_auxilio.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';
import 'package:vidar_app/utils/functions/colors.dart';

class EmergenciasPage extends StatelessWidget {
  const EmergenciasPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(TTexts.tituloPrincipalEmergencias),
        backgroundColor: TColors.primaryAppColor,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: NumerosRoboAuxilio()),
        ],
      ),
    );
  }
}
