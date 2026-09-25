import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/services/camera_to_matrix4.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/camera.dart';

@Dependencies([MapCameraChanges, mapCameraSnapshot])
class CameraTransform extends ConsumerWidget {
  const CameraTransform({super.key, required this.child});
  // Permet de déplacer le canvas en restant sync avec la camera

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mapCameraChangesProvider);
    final snap = ref.read(mapCameraSnapshotProvider);
    final transform = buildCameraTransform(
      scale: snap.zoomScale,
      screenCenter: snap.screenCenter,
      worldCenter: snap.worldCenter,
      rotationRad: snap.rotationRad,
    );
    return Transform(
      alignment: Alignment.topLeft,
      transform: transform,
      child: child,
    );
  }
}
