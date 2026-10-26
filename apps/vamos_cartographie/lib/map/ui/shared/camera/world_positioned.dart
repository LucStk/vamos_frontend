import 'package:domain_core/space/offset_type.dart';
import 'package:flutter/material.dart';

// import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';

// world_positioned.dart (ou un fichier utilitaire)
const kEmptyPositioned = Positioned(
  left: 0,
  top: 0,
  width: 0,
  height: 0,
  child: SizedBox.shrink(),
);

// @Dependencies([cameraOrNull])
class WorldPositioned extends ConsumerWidget {
  const WorldPositioned({
    super.key,
    required this.worldOffset,
    required this.child,
    this.offset = Offset.zero,
    this.alignment = Alignment.topLeft,
  });

  final WorldOffset worldOffset;
  final Widget child;

  /// Décalage supplémentaire en pixels écran.
  final Offset offset;

  /// Point du widget aligné sur la position écran.
  final Alignment alignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = ref.watch(readyCameraProvider);
    if (camera == null) {
      return kEmptyPositioned;
    }

    return ListenableBuilder(
      listenable: camera.changes,
      child: child,
      builder: (context, child) {
        final screenOffset = camera.worldToScreen(worldOffset);
        return Positioned(
          left: screenOffset.dx + offset.dx,
          top: screenOffset.dy + offset.dy,
          child: FractionalTranslation(
            translation: Offset(
              -((alignment.x + 1) / 2),
              -((alignment.y + 1) / 2),
            ),
            child: this.child,
          ),
        );
      },
    );
  }
}
