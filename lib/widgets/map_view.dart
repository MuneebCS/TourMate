import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  LatLng _markerPosition =
      const LatLng(30.546191, 78.761761); // Initial position of the marker

  @override
  Widget build(BuildContext context) {
    const lat = 30.546191;
    const lon = 78.761761;
    final initialCoordinates = LatLng(lat, lon);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor,
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
      child: FlutterMap(
        options: MapOptions(
          crs: const Epsg3857(),
          initialCenter: initialCoordinates,
          initialZoom: 10.0,
          initialRotation: 0.0,
          cameraConstraint: const CameraConstraint.unconstrained(),
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.all,
          ),
          minZoom: 10.0,
          maxZoom: 18.0,
          backgroundColor: Colors.transparent,
          onTap: (tapPosition, latLng) {
            setState(() {
              _markerPosition = latLng;
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 70.0,
                height: 70.0,
                point: _markerPosition,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
