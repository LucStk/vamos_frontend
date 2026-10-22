import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/mode/menu_placement.dart';
// import 'package:vamos_cartographie/map/mode/mode_scope.dart';
import 'package:vamos_cartographie/map/ui/features/waypoint/menu/waypoint_menu.dart';

import 'package:vamos_cartographie/map/ui/shared/camera/world_positioned.dart';

@Dependencies([modeSelection, ModeMachine])
class TripOriginMenuWidget extends ConsumerWidget {
  const TripOriginMenuWidget(this.mode, {super.key});

  final CreateTripMode mode;

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
      TripOriginMenu _ => WorldPositioned(
        offset: Offset(0, -50),
        worldOffset: placement.world,
        alignment: Alignment.bottomCenter,
        child: WaypointMenuWidget(
          createFrom: () {},
          drawFrom: () {},
          delete: onDelete,
          move: () {},
        ),
      ),
      _ => kEmptyPositioned,
    };
  }
}
