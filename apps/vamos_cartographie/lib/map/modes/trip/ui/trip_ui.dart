// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/day/dialog/day_info_dialog.dart';
import 'package:vamos_cartographie/map/entities/waypoint/dialog/waypoint_info_dialog.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_chrome_visibility.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_edit_menus.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_info_dialog.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';

class TripReadyUi extends ConsumerWidget {
  const TripReadyUi(this.mode, {super.key});

  final TripReadyMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(modeSelectionProvider);

    // Le voyage, un jour, un de ses morceaux et un waypoint sont des dialogs
    // au-dessus du dock : son bouton du milieu y devient la croix.
    final dialog = switch (selected) {
      MapTrip() => TripInfoDialog(
        key: const ValueKey('trip_dialog'),
        mode: mode,
      ),
      MapWaypoint(:final id) => WaypointInfoDialog(
        key: const ValueKey('waypoint_dialog'),
        mode: mode,
        id: id,
      ),
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
    final hideChrome = ref.watch(tripDialogHidesChromeProvider);

    // Dans un jour (ou l'un de ses morceaux), le bouton de droite mène au
    // jour suivant.
    final dayMode = selected is MapDaySegment || selected is MapDayRun;
    VoidCallback? onNextDay;
    if (dayMode) {
      final endsAt = switch (selected) {
        MapDaySegment(:final endsAt) => endsAt,
        MapDayRun(:final endsAt) => endsAt,
        _ => null,
      };
      final days = ref.watch(routeDaysProvider(mode.tripId));
      final index = days.indexWhere((d) => d.endsAt == endsAt);
      final next = index < 0
          ? null
          : days.skip(index + 1).where((d) => d.hasGeometry).firstOrNull;
      if (next != null) {
        onNextDay = () => ref.applyTransition(
          Transition.set<MapObject>(
            selectionSlot,
            MapDaySegment(tripId: mode.tripId, endsAt: next.endsAt),
          ),
        );
      }
    }

    // Chaque enfant a sa clé : en retirer un (recherche) ou en ajouter un
    // (dialog) ne décale pas les autres, dont l'état est conservé.
    return Stack(
      fit: StackFit.expand,
      children: [
        // Jour, morceau, waypoint : la carte reste dégagée.
        if (!hideChrome)
          const KeyedSubtree(key: ValueKey('search'), child: SearchTopSheet()),
        // Une fiche ouverte (avec sa croix) ou, à défaut, les trois boutons :
        // retour, fiche du voyage, édition.
        ?dialog,
        KeyedSubtree(
          key: const ValueKey('dock'),
          child: TripReadyDock(
            mode: mode,
            infoOpen: infoOpen,
            dayMode: dayMode,
            onNextDay: onNextDay,
            onBack: () => ref.applyTransition(mode.back),
            onInfo: () => ref.applyTransition(
              infoOpen ? mode.closeSheet : mode.showInfo,
            ),
            onEdit: () => ref.applyTransition(mode.edit),
          ),
        ),
        KeyedSubtree(key: const ValueKey('menus'), child: TripEditMenus(mode)),
      ],
    );
  }
}
