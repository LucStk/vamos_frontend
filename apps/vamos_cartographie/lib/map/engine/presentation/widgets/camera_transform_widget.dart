import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/services/camera_to_matrix4.dart';
import 'package:vamos_cartographie/map/engine/injection/map_camera_provider.dart';

class CameraTransform extends ConsumerWidget {
  const CameraTransform({super.key, required this.child});
  // Permet de déplacer le canvas en restant sync avec la camera

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = ref.watch(mapCameraHolderProvider);
    ref.watch(mapCameraChangesProvider);
    final transform = buildCameraTransform(camera);
    return Transform(
      alignment: Alignment.topLeft,
      transform: transform,
      child: child,
    );
  }
}
