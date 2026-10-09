import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import '../../injection/map_mode.dart';
import '/map/camera/injection/map_camera_provider.dart';

@Dependencies([mapCamera, modeOverlay])
LatLng? contextMenuLatLngPosition(WidgetRef ref, TripId tripId) {
  final d = ref.watch(modeOverlayProvider);
  if (d is! ContextMenuOverlay) return null;
  final camera = ref.read(mapCameraProvider);
  return camera.screenOffsetToLatLng(d.at);
}
