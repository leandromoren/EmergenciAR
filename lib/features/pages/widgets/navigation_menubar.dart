import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vidar_app/features/pages/contactos_page.dart';
import 'package:vidar_app/features/pages/emergencias_page.dart';
import 'package:vidar_app/features/pages/home_page.dart';
import 'package:vidar_app/utils/functions/colors.dart';
import 'package:vidar_app/utils/functions/helper_functions.dart';

class NavigationMenuBar extends StatelessWidget {
  const NavigationMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.dark : Colors.white,
          indicatorColor: darkMode
              ? TColors.light.withOpacity(0.1)
              : TColors.dark.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Inicio'),
            NavigationDestination(icon: Icon(Iconsax.map), label: 'Mapa'),
            NavigationDestination(
                icon: Icon(Iconsax.health), label: 'Emergencias'),
            NavigationDestination(
                icon: Icon(Iconsax.user_search), label: 'Contactos'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    Container(
      color: Colors.green,
    ),
    const EmergenciasPage(),
    const ContactosPage()
  ];
}
