import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MapContextAction {
  final IconData icon;
  final String label;
  final Future<void> Function(LatLng latLng)? onTap;

  const MapContextAction({required this.icon, required this.label, this.onTap});
}
