import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/mode/menu_placement.dart';
import 'package:vamos_cartographie/map/ui/modes/edit_trip_mode/menu/trip_origin_menu.dart';
import 'package:vamos_cartographie/map/ui/modes/edit_trip_mode/menu/waypoint_menu.dart';
import 'package:vamos_cartographie/map/ui/modes/sketch_mode/pencil_menu_widget.dart';
// import 'package:vamos_cartographie/map/mode/mode_scope.dart';

import 'package:vamos_cartographie/map/ui/shared/camera/world_positioned.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/object_menu_shell.dart';

@Dependencies([modeSelection, ModeMachine])
class SketchModeMenus extends ConsumerWidget {
  const SketchModeMenus(this.mode, {super.key});

  final SketchEdition mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placement = ref.watch(menuPlacementProvider);

    if (placement == null) {
      return kEmptyPositioned;
    }
    void onDelete() {
      final selection = ref.read(modeSelectionProvider);
      // final handler = ref.watch(handlerRegistryProvider);
      ref.read(modeMachineProvider).apply(selection?.delete());
    }

    return switch (placement.overlay) {
      PencilMenu _ => ObjectMenuShell(
        worldOffset: placement.world,
        child: PencilMenuWidget(endSketch: () {}),
      ),
      _ => kEmptyPositioned,
    };
  }
}
