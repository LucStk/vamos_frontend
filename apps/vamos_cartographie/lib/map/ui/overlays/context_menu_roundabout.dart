import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/features/segment/menu/sketch_pencil_menu.dart';
import 'package:vamos_cartographie/map/ui/features/vertex/menu/vertex_menu.dart';
import 'package:vamos_cartographie/map/ui/features/vertex/popup/popup_create_vertex.dart';

import 'package:vamos_cartographie/map/camera/camera_or_null.dart';
import 'package:vamos_cartographie/map/scene/items/sketch_segment/sketch_item_provider.dart';
import 'package:vamos_cartographie/map/scene/items/vertex/vertex_item_provider.dart';

@Dependencies([modeOverlay, modeMachine, CameraOrNull, pencilItem, vertexItem])
class ContextMenuRoundabout extends ConsumerWidget {
  const ContextMenuRoundabout({super.key, required this.tripId});
  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editor = ref.read(modeMachineProvider);
    final d = ref.watch(modeOverlayProvider);
    if (d is! ContextMenuOverlay) return SizedBox.shrink();
    return switch (d) {
      VertexMenu _ => VertexMenuWidget(
        drawFrom: () {},
        createFrom: () {},
        delete: () {},
        move: () {},
      ),
      PencilMenu _ => SketchPencilMenuWidget(
        onPressed: () => editor.apply(d.valideCreation()),
      ),
      MapPointMenu _ => PopupCreateVertexWidget(
        onPressed: () => editor.apply(d.createVertex()),
      ),
      _ => SizedBox.shrink(),
    };
  }
}
