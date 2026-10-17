import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';

/// Déplace le canvas en restant synchronisé avec la caméra.
@Dependencies([mapCamera])
class CameraTransform extends ConsumerWidget {
  const CameraTransform({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = ref.watch(mapCameraProvider);

    return ListenableBuilder(
      listenable: Listenable.merge([camera.ready, camera.changes]),
      // Construit une seule fois : seul le Transform suit la caméra.
      child: child,
      builder: (context, child) {
        // transformMatrix lit mapController.camera, qui plante avant le montage.
        if (!camera.ready.value) return const SizedBox.shrink();

        return Transform(
          alignment: Alignment.topLeft,
          transform: camera.transformMatrix,
          child: child,
        );
      },
    );
  }
}
