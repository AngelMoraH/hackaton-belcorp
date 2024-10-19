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
  void initState() {
    super.initState();
  }

  final List<LatLng> _points = [
    const LatLng(-12.0779, -76.9167), // Punto original
    const LatLng(-12.0785, -76.9172), // Cercano al original, al noreste
    const LatLng(-12.0792, -76.9180), // Más al noreste
    const LatLng(-12.0773, -76.9190), // Al sureste
    const LatLng(-12.0765, -76.9175), // Al suroeste
    const LatLng(-12.0760, -76.9185), // Un poco más al sur
    const LatLng(-12.0790, -76.9155), // Al noroeste, más cercano
    const LatLng(-12.0800, -76.9140), // Al noroeste, más lejano
    const LatLng(-12.0780, -76.9200), // Al este
    const LatLng(-12.0787, -76.9190), // Al noreste, cerca
    const LatLng(-12.0772, -76.9178), // Al suroeste
    const LatLng(-12.0768, -76.9182), // Cerca, hacia el sur
    const LatLng(-12.0793, -76.9163), // Norte, cercano
    const LatLng(-12.0776, -76.9158), // Oeste, más cercano
    const LatLng(-12.0769, -76.9165), // Suroeste, más cercano
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shops near you'),
      ),
      body: Stack(
        children: [
          FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(-12.0781, -76.9167),
                initialZoom: 18.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: "com.example.app",
                ),
                MarkerLayer(
                  markers: _points.map((point) {
                    return Marker(
                      point: point,
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 50,
                      ),
                    );
                  }).toList(),
                ),
              ]),
        ],
      ),
    );
  }
}
