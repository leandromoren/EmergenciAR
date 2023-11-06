import 'package:flutter/material.dart';

class MyTextFieldLogin extends StatelessWidget {

  final controller;
  final String hintText;
  final String obscureText;

  const MyTextFieldLogin({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    //username textfield login
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                )
              ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400
                )
              ),
            fillColor: Colors.grey.shade200,
            filled: true,

            //texto de sugerencia
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500]
            ),
          ),
          obscureText: obscureText == 'true' ? true : false,
      ),
    );
  }
}