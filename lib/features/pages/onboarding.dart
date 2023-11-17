// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vidar_app/features/pages/widgets/onboarding_page.dart';
import 'package:vidar_app/features/pages/widgets/onboarding_saltar.dart';
import 'package:vidar_app/utils/constants/image_strings.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            children: [
              OnBoardingWidgetPage(
                imagen: TImages.onboard1,
                titulo: TTexts.onBoardingTitle1,
                subtitulo: TTexts.onBoardSubTitle1
              ),
              OnBoardingWidgetPage(
                imagen: TImages.onboard1,
                titulo: TTexts.onBoardingTitle2,
                subtitulo: TTexts.onBoardSubTitle2
              ),
              OnBoardingWidgetPage(
                imagen: TImages.onboard1,
                titulo: TTexts.onBoardingTitle3,
                subtitulo: TTexts.onBoardSubTitle3
              ),
            ]
          ),
          /// Skip button
          OnBoardingSaltar()
        ],
      ),
    );
  }
}
//PENDIENTE > CREAR UN DISENIO EN EL FOOTER DE LA PANTALLA TIPO WAVE COLOR VERDOSO