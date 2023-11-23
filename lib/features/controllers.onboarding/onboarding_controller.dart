import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidar_app/features/pages/home_page.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //Actualizar indice cuando la pagina scrollea
  void actualizarIndicadorPagina(index) {
    currentPageIndex.value = index;
  }

  //Saltar al punto especifico de la pagina seleccionada
  void navegarPuntoClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //Actualizar indice y saltar a la siguiente pagina
  void siguientePagina() {
    if (currentPageIndex.value == 2) {
      Get.to(const HomePage());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //Actualizar indice y saltar a la ultima pagina
  void saltarPagina() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}