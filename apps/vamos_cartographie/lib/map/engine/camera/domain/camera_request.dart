import 'package:flutter/painting.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

enum CameraPriority { ambient, content, explicit } // l'index sert à comparer

sealed class CameraTarget {
  const CameraTarget();
}

final class FocusPoint extends CameraTarget {
  const FocusPoint(this.point, {this.zoom, this.minZoom = 0});
  final LatLng point;
  final double? zoom; // null = garder le zoom courant
  final double minZoom; // évite de dézoomer
}

final class FitBounds extends CameraTarget {
  const FitBounds(this.bounds, {this.padding = const EdgeInsets.all(48)});
  final LatLngBounds bounds;
  final EdgeInsets padding;
}

final class CameraRequest {
  const CameraRequest(this.target, {this.priority = CameraPriority.content});
  final CameraTarget target;
  final CameraPriority priority;
}
