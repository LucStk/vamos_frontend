import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/helpers/mode_apply.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/mode/menu_placement.dart';
import 'package:vamos_cartographie/map/ui/modes/edit_trip/active/menu/section_menu.dart';
import 'package:vamos_cartographie/map/ui/modes/edit_trip/active/menu/trip_end_menu.dart';
import 'package:vamos_cartographie/map/ui/modes/edit_trip/active/menu/trip_origin_menu.dart';
// import 'package:vamos_cartographie/map/mode/mode_scope.dart';

import 'package:vamos_cartographie/map/ui/shared/menus/overlay_menu.dart';

@Dependencies([modeSelection, ModeMachine, menuPlacement])
class TripModeContextualMenu extends ConsumerWidget {
  const TripModeContextualMenu(this.mode, {super.key});
  final TripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripId = mode.tripId;
    void apply(Transition<AppMode>? t) =>
        ref.read(modeMachineProvider).apply(t);

    return Stack(
      fit: StackFit.expand,
      children: [
        OverlayMenu<TripOriginMenu>(
          builder: (_, menu, world) => TripOriginMenuWidget(
            prependRoute: () {},
            move: () {}, // => apply(MoveTripOriginMode.start(tripId, world)),
            extendRoute: () => apply(SketchEdition.start(tripId, world)),
          ),
        ),
        OverlayMenu<TripEndMenu>(
          builder: (_, menu, world) => TripEndMenuWidget(
            extendRoute: () => apply(SketchEdition.start(tripId, world)),
          ),
        ),

        OverlayMenu<SectionMenu>(
          builder: (_, _, _) => SectionMenuWidget(
            createFrom: () {},
            drawFrom: () {},
            move: () {},
            delete: () => ref.applyTransition(
              Transition.run(
                DeleteRoute(tripId: tripId),
                then: (_, data) => data.fold(
                  (l) => Transition.stay(),
                  (_) => TripMode.open(tripId),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
