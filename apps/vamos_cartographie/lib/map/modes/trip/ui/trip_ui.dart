// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
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
import 'package:vamos_cartographie/map/modes/trip/ui/trip_selection_camera.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_title_banner.dart';

class TripReadyUi extends ConsumerStatefulWidget {
  const TripReadyUi(this.mode, {super.key});

  final TripReadyMode mode;

  @override
  ConsumerState<TripReadyUi> createState() => _TripReadyUiState();
}

class _TripReadyUiState extends ConsumerState<TripReadyUi> {
  TripReadyMode get mode => widget.mode;

  @override
  void initState() {
    super.initState();
    // On revient d'un autre mode (déplacement d'une étape, sélection d'une
    // portion, édition) avec une fiche déjà ouverte : la sélection n'a pas
    // changé, rien ne la cadre. On le fait ici, une fois la fiche en place.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final selected = ref.read(modeSelectionProvider);
      if (selected == null) return;
      frameSelection(
        ref,
        mode.tripId,
        selected,
        padding: selectionFramePadding(context),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(modeSelectionProvider);

    // Un jour, un morceau ou un waypoint choisi : la caméra le cadre, dans la
    // partie de la carte que son dialog laisse libre.
    final framePadding = selectionFramePadding(context);
    ref.listen(modeSelectionProvider, (previous, next) {
      frameSelection(ref, mode.tripId, next, padding: framePadding);
    });

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

    // Dans un jour (ou l'un de ses morceaux), les boutons des côtés mènent au
    // jour précédent et au jour suivant (absents s'il n'y en a pas).
    final dayMode = selected is MapDaySegment || selected is MapDayRun;
    VoidCallback? onPreviousDay;
    VoidCallback? onNextDay;
    if (dayMode) {
      final endsAt = switch (selected) {
        MapDaySegment(:final endsAt) => endsAt,
        MapDayRun(:final endsAt) => endsAt,
        _ => null,
      };
      final days = ref.watch(routeDaysProvider(mode.tripId));
      final index = days.indexWhere((d) => d.endsAt == endsAt);
      final previous = index < 0
          ? null
          : days.take(index).where((d) => d.hasGeometry).lastOrNull;
      final next = index < 0
          ? null
          : days.skip(index + 1).where((d) => d.hasGeometry).firstOrNull;
      VoidCallback goTo(RouteDay day) =>
          () => ref.applyTransition(
            Transition.set<MapObject>(
              selectionSlot,
              MapDaySegment(tripId: mode.tripId, endsAt: day.endsAt),
            ),
          );
      if (previous != null) onPreviousDay = goTo(previous);
      if (next != null) onNextDay = goTo(next);
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
            onPreviousDay: onPreviousDay,
            onNextDay: onNextDay,
            onBack: () => ref.applyTransition(mode.back),
            onInfo: () =>
                ref.applyTransition(infoOpen ? mode.closeSheet : mode.showInfo),
            // Sur une étape, le crayon la déplace ; sinon on modifie le voyage.
            editIcon: selected is MapWaypoint ? Icons.edit : Icons.route,
            editTooltip: selected is MapWaypoint
                ? 'Déplacer l’étape'
                : 'Modifier le voyage',
            onEdit: () => ref.applyTransition(
              selected is MapWaypoint
                  ? mode.editWaypoint(selected.id)
                  : mode.edit,
            ),
          ),
        ),
        KeyedSubtree(key: const ValueKey('menus'), child: TripEditMenus(mode)),
        // À l'entrée dans le trip : son titre, qui s'efface de lui-même. Par
        // trip, pour rejouer l'animation si on en ouvre un autre.
        TripTitleBanner(
          key: ValueKey('title_${mode.tripId}'),
          tripId: mode.tripId,
        ),
      ],
    );
  }
}
