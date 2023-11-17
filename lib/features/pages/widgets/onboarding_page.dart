import 'package:flutter/material.dart';
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
            width: THelperFunctions.screenWidth() * 0.8,
            height: THelperFunctions.screenHeight() * 0.6,
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
          )
        ],
      ),
    );
  }
}