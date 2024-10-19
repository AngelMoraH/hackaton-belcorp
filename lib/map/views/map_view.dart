import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Stack(
        children: [
          FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(51.5, -0.09),
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: "com.datastormer.lumea",
                ),
                const MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(30, 40),
                      width: 80,
                      height: 80,
                      child: FlutterLogo(),
                    ),
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}
