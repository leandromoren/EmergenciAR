import 'package:flutter/material.dart';
import 'package:vidar_app/utils/constants/sizes.dart';
import 'package:vidar_app/utils/functions/helper_functions.dart';

class FooterBackground extends StatelessWidget {
  const FooterBackground({
    super.key,
    required this.imagen
  });

  final String imagen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth() * 0.5,
            height: THelperFunctions.screenHeight() * 0.3,
            image: AssetImage(imagen),
          ),
        ],
      ),
      
    );
  }
}