import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vidar_app/features/pages/widgets/FarmaciaUbicacionMapa.dart';
import 'package:vidar_app/features/pages/widgets/PoliciaUbicacionMapa.dart';
import 'package:vidar_app/features/pages/widgets/compartir_ubicacion.dart';
import 'package:vidar_app/features/pages/widgets/hospital_ubicacion_mapa.dart';
import 'package:vidar_app/features/pages/widgets/mapa.dart';
import 'package:vidar_app/features/pages/widgets/mcdonalds_ubicacion_mapa.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';
import 'package:vidar_app/utils/functions/colors.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({super.key});

  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';
    if (Platform.isAndroid) {
      if (await canLaunchUrl(Uri.parse(googleUrl))) {
        await launchUrl(Uri.parse(googleUrl));
      } else {
        throw TTexts.msjErrorAbrirMapa;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text(TTexts.tituloMapaPage),
      backgroundColor: TColors.navbarBackgroundColor,
    ),
    body: Column(
      children: [
        // ignore: sized_box_for_whitespace
        Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 9.0),
                  child: PoliciaUbicacion(onMapFunction: openMap),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 9.0),
                  child: FarmaciaUbicacion(onMapFunction: openMap),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 9.0),
                  child: HospitalUbicacion(onMapFunction: openMap),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 9.0),
                  child: McDonaldsUbicacion(onMapFunction: openMap),
                ),
                //MapaView()
                
              ],
            ),
          )
        ),
        const MapaView(),
      ],
    ),
  );
  }
}