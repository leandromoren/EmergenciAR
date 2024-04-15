import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaView extends StatelessWidget {
  const MapaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-34.734390, -58.232628), // Coordenadas del centro del mapa
          initialZoom: 13.0,
        ), // Nivel de zoom inicial
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'], // Subdominios para distribuir la carga del servidor
          ),
        ],
      ),
    );
  }
}