import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/mode/menu_placement.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/menu/trip_origin_menu.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/menu/waypoint_menu.dart';
// import 'package:vamos_cartographie/map/mode/mode_scope.dart';

import 'package:vamos_cartographie/map/ui/shared/camera/world_positioned.dart';
import 'package:vamos_cartographie/map/ui/shared/menus/object_menu_shell.dart';

@Dependencies([modeSelection, ModeMachine])
class TripModeContextualMenu extends ConsumerWidget {
  const TripModeContextualMenu(this.mode, {super.key});

  final TripMode mode;

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

    bool isGeometryEmpty() {
      final route = ref.read(
        routeStoreProvider(
          mode.tripId,
        ).select((s) => s.route?.current.geometry),
      );
      if (route == null || route.isEmpty) {
        return true;
      }
      return false;
    }

    return switch (placement.overlay) {
      TripOriginMenu _ => ObjectMenuShell(
        worldOffset: placement.world,
        child: TripOriginMenuWidget(
          geometryEmpty: isGeometryEmpty(),
          prependRoute: () {},
          move: () {},
          extendRoute: () => ref
              .watch(modeMachineProvider)
              .apply(SketchEdition.start(mode.tripId, placement.world)),
        ),
      ),
      WaypointMenu _ => ObjectMenuShell(
        worldOffset: placement.world,
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
