// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/day_sheet_pages.dart';
import 'package:vamos_cartographie/map/entities/day/sheet_pages/run_sheet_pages.dart';
import 'package:vamos_cartographie/map/entities/waypoint/sheet_pages/waypoint_sheet_pages.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_edit_menus.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_info_dialog.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_sheet.dart';

class TripReadyUi extends ConsumerWidget {
  const TripReadyUi(this.mode, {super.key});

  final TripReadyMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(modeSelectionProvider);

    final pages = switch (selected) {
      MapWaypoint(:final id, :final tripId) => waypointSheetPages(
        tripId,
        ref.watch(waypointProvider(tripId, id)),
        editable: !mode.readOnly,
      ),
      MapDayRun(:final tripId, :final endsAt, :final spanId) => runSheetPages(
        tripId,
        endsAt,
        spanId,
        editable: !mode.readOnly,
      ),
      MapDaySegment(:final tripId, :final endsAt) => daySheetPages(
        tripId,
        endsAt,
        editable: !mode.readOnly,
      ),
      _ => null,
    };

    // La fiche du voyage est un dialog au-dessus du dock, pas une sheet.
    final infoOpen = selected is MapTrip;

    return Stack(
      fit: StackFit.expand,
      children: [
        SearchTopSheet(),
        // Une fiche ouverte (avec sa croix) ou, à défaut, les trois boutons :
        // retour, fiche du voyage, édition.
        if (pages == null) ...[
          if (infoOpen) TripInfoDialog(mode: mode),
          TripReadyDock(
            mode: mode,
            infoOpen: infoOpen,
            onBack: () => ref.applyTransition(mode.back),
            onInfo: () => ref.applyTransition(
              infoOpen ? mode.closeSheet : mode.showInfo,
            ),
            onEdit: () => ref.applyTransition(mode.edit),
          ),
        ] else
          PagedSheet(
            pages: pages,
            // Fermée par la croix, jamais par un glissement : seule la croix
            // retire la fiche.
            hideable: false,
            onClose: () => ref.applyTransition(mode.closeSheet),
          ),
        TripEditMenus(mode),
      ],
    );
  }
}
