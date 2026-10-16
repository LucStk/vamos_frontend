import 'package:domain_core/space/offset_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/camera_or_null.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/sketch_item_provider.dart';
import 'package:vamos_cartographie/map/scene/items/vertex/vertex_item_provider.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/context_menu.dart';

@Dependencies([modeOverlay, CameraOrNull, vertexItem, pencilItem])
class ObjectMenuShell extends ConsumerWidget {
  const ObjectMenuShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlay = ref.watch(modeOverlayProvider);
    if (overlay is! MapObjectMenu) {
      return const SizedBox.shrink();
    }

    final camera = ref.read(cameraOrNullProvider);
    if (camera == null) {
      return const SizedBox.shrink();
    }

    final position = switch (overlay) {
      PencilMenu() => _pencilPosition(ref, camera),
      VertexMenu(:final object) => _vertexPosition(ref, camera, object),
      _ => null,
    };

    if (position == null) {
      return const SizedBox.shrink();
    }

    return Positioned(
      left: position.dx,
      top: position.dy,
      child: FractionalTranslation(
        translation: const Offset(-0.5, -1.5),
        child: ContextMenu(child),
      ),
    );
  }
}
