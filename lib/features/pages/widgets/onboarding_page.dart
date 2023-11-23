// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:vidar_app/features/pages/widgets/footer_background.dart';
import 'package:vidar_app/utils/constants/image_strings.dart';
import 'package:vidar_app/utils/constants/sizes.dart';
import 'package:vidar_app/utils/functions/helper_functions.dart';

class OnBoardingWidgetPage extends StatelessWidget {
  const OnBoardingWidgetPage({
    super.key,
    required this.imagen,
    required this.titulo,
    required this.subtitulo,
  });

  final String imagen, titulo, subtitulo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth() * 0.7,
            height: THelperFunctions.screenHeight() * 0.5,
            image: AssetImage(imagen),
          ),
          Text(
            titulo,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Container(
            child: Text(
              subtitulo,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          //const SizedBox(height: 100),
          const FooterBackground(imagen: TImages.onboard4)
        ],
      ),
    );
  }
}