import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vidar_app/features/controllers.onboarding/onboarding_controller.dart';
import 'package:vidar_app/utils/constants/sizes.dart';
import 'package:vidar_app/utils/functions/colors.dart';
import 'package:vidar_app/utils/functions/device_utilitiy.dart';
import 'package:vidar_app/utils/functions/helper_functions.dart';

class OnBoardingBotonSiguiente extends StatelessWidget {
  const OnBoardingBotonSiguiente({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: (){
          OnBoardingController.instance.siguientePagina();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.light : TColors.dark
        ),
        child: const Icon(Iconsax.arrow_right_3),
      )
    );
  }
}