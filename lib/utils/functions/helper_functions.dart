import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  static void showSnackBar(String mensaje){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(mensaje),
      )
    );
  }

  static void showAlert(String title, String mensaje) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )  
          ]
        );
      }
    );
  }

  static String truncateText(String text, int maxLenght) {
    if (text.length <= maxLenght) {
      return text;
    } else {
      return '${text.substring(0, maxLenght)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }
}