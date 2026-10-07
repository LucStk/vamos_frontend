import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math' as math;

import 'package:riverpod_annotation/experimental/scope.dart';

import '../camera/injection/map_camera_provider.dart';
import "map_mode.dart";
part 'popup_provider.g.dart';

// final projection = const Epsg3857().projection;

/// Position écran du popup, recalculée à chaque mouvement de la carte.
@Riverpod(keepAlive: true, dependencies: [mapCamera, mapMode])
WorldOffset? popupWorldPosition(Ref ref) {
  final position = ref.watch(mapModeProvider).popUpPosition;
  if (position == null) return null;

  final camera = ref.read(mapCameraProvider);
  return camera.screenToWorld(position);
}

@Dependencies([popupWorldPosition, mapCameraSnapshot])
final popupScreenPositionProvider = Provider<ScreenOffset?>(
  dependencies: [popupWorldPositionProvider, mapCameraSnapshotProvider],
  (ref) {
    final world = ref.watch(popupWorldPositionProvider);
    if (world == null) return null;

    final cam = ref.watch(mapCameraSnapshotProvider);

    final dx = (world.dx - cam.worldCenter.dx) * cam.zoomScale;
    final dy = (world.dy - cam.worldCenter.dy) * cam.zoomScale;

    final cos = math.cos(cam.rotationRad);
    final sin = math.sin(cam.rotationRad);

    return ScreenOffset(
      Offset(
        cam.screenCenter.dx + dx * cos - dy * sin,
        cam.screenCenter.dy + dx * sin + dy * cos,
      ),
    );
  },
);
