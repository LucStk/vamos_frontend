import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/chrome/mode_tabs_sheet.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/pages/waypoint_create_compact.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/mode_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/sheet_page.dart';

/// UI partagée par [WaypointsEditMode] (aucun onglet ouvert) et ses
/// sous-modes, un par onglet. Tous l'affichent : la sheet est conservée.
class WaypointsEditUi extends ConsumerWidget {
  const WaypointsEditUi(this.mode, {super.key});

  final TripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripId = mode.tripId;

    return ModeTabsSheet(
      mode: mode,
      closed: () => WaypointsEditMode(tripId),
      barLeading: BackTab(onTap: () => ref.applyTransition(mode.back)),
      tabs: [
        ModeTab(
          open: () => CreateWaypointMode(tripId),
          page: SheetPage(
            label: 'Créer',
            icon: Icons.add_location_alt_outlined,
            selectedIcon: Icons.add_location_alt,
            compact: waypointCreateCompact(tripId),
          ),
        ),
        // ModeTab(
        //   open: () => DrawWaypointMode(tripId),
        //   page: SheetPage(
        //     label: 'Dessiner',
        //     icon: Icons.draw_outlined,
        //     selectedIcon: Icons.draw,
        //     compact: ...,
        //   ),
        // ),
      ],
    );
  }
}
