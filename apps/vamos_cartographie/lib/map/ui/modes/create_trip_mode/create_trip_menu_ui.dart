import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/mode/menu_placement.dart';
// import 'package:vamos_cartographie/map/mode/mode_scope.dart';

import 'package:vamos_cartographie/map/ui/modes/create_trip_mode/trip_origin_menu_widget.dart';
import 'package:vamos_cartographie/map/ui/shared/camera/world_positioned.dart';

@Dependencies([modeSelection, ModeMachine])
class TripOriginMenuUi extends ConsumerWidget {
  const TripOriginMenuUi(this.mode, {super.key});

  final CreateTripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placement = ref.watch(menuPlacementProvider);
    if (placement == null) {
      return kEmptyPositioned;
    }
    return switch (placement.overlay) {
      TripOriginMenu _ => WorldPositioned(
        offset: Offset(0, -20),
        worldOffset: placement.world,
        alignment: Alignment.bottomCenter,
        child: TripOriginMenuWidget(createFrom: () {}),
      ),
      _ => kEmptyPositioned,
    };
  }
}
