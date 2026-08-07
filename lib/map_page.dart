import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TankFinder Karte'),
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(47.3769, 8.5417),
          initialZoom: 13,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.tankfinder_app',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(47.3769, 8.5417),
                width: 40,
                height: 40,
                child: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}