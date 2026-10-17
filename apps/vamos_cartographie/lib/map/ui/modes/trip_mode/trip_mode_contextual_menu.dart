import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/camera/camera_or_null.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/mode/menu_placement.dart';
import 'package:vamos_cartographie/map/ui/features/vertex/menu/vertex_menu.dart';

import 'package:vamos_cartographie/map/ui/shared/camera/world_positioned.dart';

@Dependencies([modeSelection, ModeMachine])
class TripModeContextualMenu extends ConsumerWidget {
  const TripModeContextualMenu(this.mode, {super.key});

  final TripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placement = ref.watch(menuPlacementProvider);
    final camera = ref.watch(cameraOrNullProvider);
    if (camera == null || placement == null) {
      return kEmptyPositioned;
    }

    return switch (placement.overlay) {
      VertexMenu _ => WorldPositioned(
        offset: Offset(0, -50),
        worldOffset: placement.world,
        alignment: Alignment.bottomCenter,
        child: VertexMenuWidget(
          createFrom: () {},
          drawFrom: () {},
          delete: () {},
          move: () {},
        ),
      ),
      _ => kEmptyPositioned,
    };
  }
}
