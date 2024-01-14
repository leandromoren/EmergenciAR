import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class CompartirUbicacion extends StatefulWidget {
  const CompartirUbicacion({super.key});

  @override
  State<CompartirUbicacion> createState() => _CompartirUbicacionState();
}

class _CompartirUbicacionState extends State<CompartirUbicacion> {
  // ignore: unused_field
  String _ubicacion = '';
  Position? posicion;
  late bool permisoServicio = false;
  late LocationPermission permiso;
  String url = 'https://www.google.com/maps/search/?api=1&query=';

  @override
  void initState() {
    super.initState();
    _checkearPermisoDeUbicacion();
  }

  void _checkearPermisoDeUbicacion() async {
    PermissionStatus status = await Permission.locationWhenInUse.status;
    if (status != PermissionStatus.granted) {
      await Permission.locationWhenInUse.request();
    }
  }

  void compartirUbicacion() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      Position posicion = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _ubicacion =
            'Latitud: ${posicion.latitude}, Longitud: ${posicion.longitude}';
      });
      Share.share('$url${posicion.latitude},${posicion.longitude}');
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content:
                const Text('La ubicación del dispositivo está desactivada.'),
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
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: compartirUbicacion,
              child: const Text('Compartir ubicacion')),
          //const SizedBox(height: 20),
        ],
      ),
    ]);
  }
}
