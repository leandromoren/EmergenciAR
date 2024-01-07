// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:vidar_app/features/pages/widgets/help_button.dart';
import 'package:vidar_app/utils/constants/styles.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';
import 'package:vidar_app/utils/functions/colors.dart';
import 'package:vidar_app/utils/functions/helper_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: darkMode ? TColors.dark : Colors.white,
          foregroundColor: darkMode ? TColors.light : Colors.black,
          title: Text(
            'Inicio',
            style: kAppBarText ,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                
              ),
              Center(
                child: Text(
                  TTexts.tituloPrincipalHome,
                  textAlign: TextAlign.center,
                  style: kBigText.copyWith(fontWeight: FontWeight.bold)
                ),
              ),
      
              Center(
                child: Text(
                  TTexts.tituloSecundarioHome,
                  textAlign: TextAlign.center,
                  style: kHeadingText
                ),
              ),
              HelpButton(key: null),
            ],
          ),
        ),
      ),
    );
  }
}
