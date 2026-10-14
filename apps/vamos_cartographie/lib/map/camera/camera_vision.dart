// domain/camera_vision.dart
import 'package:domain_core/map_geo_bounds.dart';

class CameraVision {
  const CameraVision({required this.bounds});
  final MapLatLngBounds
  bounds; // ⚠️ adapte au type réel exposé par ton MapCamera
}
