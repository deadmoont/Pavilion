import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Mapscreen extends StatelessWidget {
  const Mapscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of LatLng coordinates for markers
    final List<LatLng> markerPositions = [
      const LatLng(25.4294, 81.7702),
    ];

    // Generate marker list from LatLng coordinates
    final List<Marker> markers = markerPositions.map((position) {
      return Marker(
        point: position,
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.location_pin,
            size: 60,
            color: Colors.red, // Set a color for your markers
          ),
        ),
      );
    }).toList();

    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(25.4294, 81.7702),
        // initialZoom: 20,
      ),
      children: [
        openStreetMapTileLayer,
        MarkerLayer(markers: markers), // Pass the dynamically generated markers here
      ],
    );
  }
}

// OpenStreetMap tile layer
TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);