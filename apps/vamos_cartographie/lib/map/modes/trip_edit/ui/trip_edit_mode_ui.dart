// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/chrome/search_top_sheet.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/trip_edit_menus.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/ui/widgets/sheet/trip_edit_actions.dart';

class TripEditModeUi extends ConsumerWidget {
  const TripEditModeUi(this.mode, {super.key});

  final TripEditMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(modeSelectionProvider);

    return Stack(
      fit: StackFit.expand,
      children: [
        SearchTopSheet(),
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
        switch (selected) {
          MapWaypoint() => WaypointSheets(mode),
          _ => TripEditSheets(mode),
        },
        TripEditMenus(mode),
      ],
    );
  }
}
