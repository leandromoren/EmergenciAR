import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vidar_app/utils/constants/text_strings.dart';
import 'package:vidar_app/utils/functions/colors.dart';

class CompartirUbicacion extends StatefulWidget {
  const CompartirUbicacion({super.key});

  @override
  State<CompartirUbicacion> createState() => _CompartirUbicacionState();
}

class _CompartirUbicacionState extends State<CompartirUbicacion> {
  late Position posicion;
  late bool permisoServicio = false;
  late LocationPermission permiso;
  String url = 'https://www.google.com/maps/search/?api=1&query=';

  @override
  void initState() {
    super.initState();
    _precargarUbicacion();
  }

  // Precarga la ubicacion para optimizar la velocidad
  // Al desplegarse el panel de apps para compartir
  Future<void> _precargarUbicacion() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      posicion = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } else {
      // ignore: use_build_context_synchronously
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Estas seguro?'),
            content: const Text(TTexts.msjDenegarPermisosDeUbicacion),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Aceptar"),
              ),
            ],
          );
        },
      );
    }
  }

  void compartirUbicacion() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      Share.share(
          '${TTexts.mensajeDeUbicacionCompartida} $url${posicion.latitude},${posicion.longitude}');
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(TTexts.ubicacionDispositivoDesactivada),
            actions: [
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: compartirUbicacion,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: compartirUbicacion,
              icon: const Icon(Icons.share_location_outlined),
              color: TColors.primaryAppColor,
              iconSize: 80.0,
            ),
          ],
        ),
      ),
    
    );
  }
}
