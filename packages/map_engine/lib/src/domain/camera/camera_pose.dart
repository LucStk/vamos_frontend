// camera_pose.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'camera_pose.freezed.dart';

@freezed
abstract class CameraPose with _$CameraPose {
  const factory CameraPose({
    required LatLng center,

    /// Niveau de zoom natif flutter_map (pas `zoomScale`).
    required double zoom,
    required double rotationDeg,
  }) = _CameraPose;
}
