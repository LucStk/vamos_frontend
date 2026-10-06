import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

import '../injection/map_camera_provider.dart';

@Dependencies([mapCameraSnapshot])
class CameraTransform extends ConsumerWidget {
  const CameraTransform({super.key, required this.child});
  // Permet de déplacer le canvas en restant sync avec la camera

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snap = ref.watch(mapCameraSnapshotProvider);
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
