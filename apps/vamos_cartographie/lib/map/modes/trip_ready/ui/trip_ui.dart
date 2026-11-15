// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/chrome/search_top_sheet.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/trip/trip_sheet_pages.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/waypoint/waypoint_sheet_pages.dart';
import 'package:vamos_cartographie/map/modes/trip_ready/ui/trip_edit_actions.dart';
import 'package:vamos_cartographie/map/modes/trip_ready/ui/trip_edit_menus.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';

class TripReadyUi extends ConsumerWidget {
  const TripReadyUi(this.mode, {super.key});

  final TripReadyMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(modeSelectionProvider);

    return Stack(
      fit: StackFit.expand,
      children: [
        SearchTopSheet(),
        if (!mode.readOnly)
          SafeArea(
            child: TripEditActions(
              editRoute: () => ref
                  .read(appModeMachineProvider.notifier)
                  .apply(Transition.to(RouteEditMode(mode.tripId))),
              editWaypoint: () => ref
                  .read(appModeMachineProvider.notifier)
                  .apply(Transition.to(WaypointsEditMode(mode.tripId))),
            ),
          ),
        DraggableBottomSheetShell(
          pages: switch (selected) {
            MapWaypoint(:final id, :final tripId) => waypointSheetPages(
              tripId,
              ref.watch(waypointProvider(tripId, id)),
              editable: !mode.readOnly,
            ),
            // MapMobilitySpan(:final id, :final tripId) => routeSheetPages(
            //   ref.watch(mobilitySpanProvider(tripId, id)),
            // ),
            _ => tripSheetPages(
              ref.watch(tripRequiredProvider(mode.tripId)),
              editable: !mode.readOnly,
            ),
          },
        ),
        TripEditMenus(mode),
      ],
    );
  }
}
