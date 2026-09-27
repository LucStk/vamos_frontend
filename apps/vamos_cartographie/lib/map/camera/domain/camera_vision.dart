// domain/camera_vision.dart
import 'package:map_engine/domain/domain.dart';

class CameraVision {
  const CameraVision({required this.bounds});
  final MapLatLngBounds
  bounds; // ⚠️ adapte au type réel exposé par ton MapCamera
}
