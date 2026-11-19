import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/pages/waypoint_create_compact.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/paged_sheet.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/sheet_page.dart';

@Dependencies([modeSelection, ModeMachine])
class WaypointsEditUi extends ConsumerWidget {
  const WaypointsEditUi(this.mode, {super.key});

  final TripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PagedSheet(
      barLeading: BackTab(onTap: () => ref.applyTransition(mode.back)),
      pages: [
        SheetPage(
          label: "Create",
          icon: Icons.add_location_alt_outlined,
          selectedIcon: Icons.add_location_alt,
          compact: waypointCreateCompact(mode.tripId),
        ),
        SheetPage(
          label: "Draw",
          icon: Icons.draw_outlined,
          selectedIcon: Icons.draw,
          compact: waypointCreateCompact(mode.tripId),
        ),
      ],
    );
  }
}
