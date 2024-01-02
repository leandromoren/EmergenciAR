import 'package:flutter/material.dart';
import 'package:vidar_app/utils/constants/styles.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String text;
  
  const Button({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {

      },
      elevation: 3.0,
      fillColor: kButtonColor,
      splashColor: kButtonColor.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: kText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}