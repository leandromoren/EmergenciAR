import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
//-34.718716744870804, -58.27376423242389
//-34.715633502682415, -58.27264148237051
//-34.725495033190995, -58.26601768802932
class MapaView extends StatelessWidget {
  const MapaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlutterMap(
        options: const MapOptions(
          initialCenter:
              LatLng(-34.734390, -58.232628),
          initialZoom: 13.0,
        ), // Nivel de zoom inicial
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const [
              'a',
              'b',
              'c'
            ], // Subdominios para distribuir la carga del servidor
          ),
          const MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(-34.734390, -58.232628),
                child: Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 247, 2, 2),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(-34.718716744870804, -58.27376423242389),
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(-34.715633502682415, -58.27264148237051),
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(-34.725495033190995, -58.26601768802932),
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.red,
                ),
              ),
               Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(-34.7201461043916, -58.24667554309701),
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(-34.720562253099274, -58.25324898073748),
                child: Icon(
                  Icons.local_police,
                  color: Color.fromARGB(255, 35, 84, 245),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
