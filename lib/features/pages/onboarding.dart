// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vidar_app/features/controllers.onboarding/onboarding_controller.dart';
import 'package:vidar_app/features/pages/widgets/onboarding_boton_siguiente.dart';
import 'package:vidar_app/features/pages/widgets/onboarding_navegacion_puntos.dart';
import 'package:vidar_app/features/pages/widgets/onboarding_page.dart';
import 'package:vidar_app/features/pages/widgets/onboarding_saltar.dart';
import 'package:vidar_app/utils/constants/image_strings.dart';
import 'package:vidar_app/utils/constants/sizes.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';
import 'package:vidar_app/utils/functions/colors.dart';
import 'package:vidar_app/utils/functions/device_utilitiy.dart';
import 'package:vidar_app/utils/functions/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.actualizarIndicadorPagina,
            children: [
              OnBoardingWidgetPage(
                imagen: TImages.onboard1,
                titulo: TTexts.onBoardingTitle1,
                subtitulo: TTexts.onBoardSubTitle1
              ),
              OnBoardingWidgetPage(
                imagen: TImages.onboard2,
                titulo: TTexts.onBoardingTitle2,
                subtitulo: TTexts.onBoardSubTitle2
              ),
              OnBoardingWidgetPage(
                imagen: TImages.onboard3,
                titulo: TTexts.onBoardingTitle3,
                subtitulo: TTexts.onBoardSubTitle3
              ),
            ]
          ),
          /// Skip button
          OnBoardingSaltar(),

          /// Puntos de navegancion
          NavegacionPuntos(),

          /// Boton circular
          OnBoardingBotonSiguiente()
        ],
      ),
    );
  }
}