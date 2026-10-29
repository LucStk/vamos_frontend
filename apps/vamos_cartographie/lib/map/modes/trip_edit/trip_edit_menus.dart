import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode_machine/helpers/mode_apply.dart';
import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/overlay_menu.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/menu/section_menu.dart';

// import 'package:vamos_cartographie/map/mode_machine/mode_scope.dart';

@Dependencies([modeSelection, ModeMachine])
class TripEditMenus extends ConsumerWidget {
  const TripEditMenus(this.mode, {super.key});
  final TripEditMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripId = mode.tripId;

    return Stack(
      fit: StackFit.expand,
      children: [
        // OverlayMenu<MapTripOrigin>(
        //   builder: (_, hit) => TripOriginMenuWidget(
        //     prependRoute: () => apply(SketchPrepend.start(tripId, hit)),
        //   ),
        // ),
        // OverlayMenu<MapTripEnd>(
        //   builder: (_, hit) => TripEndMenuWidget(
        //     extendRoute: () => apply(SketchExtend.start(tripId, hit)),
        //   ),
        // ),

        OverlayMenu<MapSection>(
          builder: (_, _) => SectionMenuWidget(
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
