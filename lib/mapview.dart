import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapview extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();

  final _pos = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  build(BuildContext ctx) {
    return GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _pos,
        onMapCreated: (GoogleMapController controller) {
          _controller.isCompleted ?? _controller.complete(controller);
        },
      );
  }
}