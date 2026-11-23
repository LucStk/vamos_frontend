// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/day/dialog/day_info_dialog.dart';
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

    // Seule la fiche d'un waypoint reste une sheet qu'on déplie.
    final pages = switch (selected) {
      MapWaypoint(:final id, :final tripId) => waypointSheetPages(
        tripId,
        ref.watch(waypointProvider(tripId, id)),
        editable: !mode.readOnly,
      ),
      _ => null,
    };

    // Le voyage, un jour et un de ses morceaux sont des dialogs au-dessus du
    // dock : son bouton du milieu y devient la croix.
    final dialog = switch (selected) {
      MapTrip() => TripInfoDialog(mode: mode),
      // Un seul widget pour le jour et ses morceaux : passer de l'un à
      // l'autre ne referme pas le dialog.
      MapDaySegment(:final endsAt) => DayInfoDialog(
        key: const ValueKey('day_dialog'),
        mode: mode,
        endsAt: endsAt,
      ),
      MapDayRun(:final endsAt, :final spanId) => DayInfoDialog(
        key: const ValueKey('day_dialog'),
        mode: mode,
        endsAt: endsAt,
        spanId: spanId,
      ),
      _ => null,
    };
    final infoOpen = dialog != null;

    return Stack(
      fit: StackFit.expand,
      children: [
        SearchTopSheet(),
        // Une fiche ouverte (avec sa croix) ou, à défaut, les trois boutons :
        // retour, fiche du voyage, édition.
        if (pages == null) ...[
          ?dialog,
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
