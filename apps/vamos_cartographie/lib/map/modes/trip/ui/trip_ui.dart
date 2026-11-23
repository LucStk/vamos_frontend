// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
import 'package:vamos_cartographie/map/entities/day/dialog/day_of_waypoint.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/entities/day/dialog/day_info_dialog.dart';
import 'package:vamos_cartographie/map/entities/waypoint/dialog/waypoint_info_dialog.dart';
import 'package:vamos_cartographie/map/modes/shared/cursor_panel.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_chrome_visibility.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_edit_menus.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_info_dialog.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_selection_camera.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_title_banner.dart';
import 'package:vamos_cartographie/map/ui/chrome/dock/edit_dock.dart';

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
    // Un curseur posé (propriétaire) : son panneau remplace le dock.
    final cursor = mode.readOnly
        ? null
        : ref.watch(modeSlotProvider(searchResultMarkerSlot));

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

    // Les boutons des côtés du dock suivent ce qui est ouvert :
    // - rien : retour à la carte principale, fiche du voyage à droite ;
    // - le voyage : seule la croix du milieu ;
    // - un jour : jour précédent et jour suivant (absents s'il n'y en a pas) ;
    // - un morceau : retour au jour ;
    // - une étape : retour à son jour, et (propriétaire) déplacement.
    final days = ref.watch(routeDaysProvider(mode.tripId));
    DockAction goToDay(
      RouteDay day, {
      required IconData icon,
      required String tooltip,
    }) => (
      icon: icon,
      tooltip: tooltip,
      onPressed: () => ref.applyTransition(
        Transition.set<MapObject>(
          selectionSlot,
          MapDaySegment(tripId: mode.tripId, endsAt: day.endsAt),
        ),
      ),
    );
    DockAction back(IconData icon, String tooltip) => (
      icon: icon,
      tooltip: tooltip,
      onPressed: () => ref.applyTransition(mode.back),
    );

    DockAction? left;
    DockAction? right;
    switch (selected) {
      case MapDaySegment(:final endsAt):
        final index = days.indexWhere((d) => d.endsAt == endsAt);
        final previous = index < 0
            ? null
            : days.take(index).where((d) => d.hasGeometry).lastOrNull;
        final next = index < 0
            ? null
            : days.skip(index + 1).where((d) => d.hasGeometry).firstOrNull;
        if (previous != null) {
          left = goToDay(
            previous,
            icon: Icons.adaptive.arrow_back,
            tooltip: 'Jour précédent',
          );
        }
        if (next != null) {
          right = goToDay(
            next,
            icon: Icons.adaptive.arrow_forward,
            tooltip: 'Jour suivant',
          );
        }
      case MapDayRun():
        left = back(Icons.u_turn_left, 'Retour à la journée');
      case MapWaypoint(:final id):
        final waypoint = ref.watch(waypointProvider(mode.tripId, id));
        final day = dayOfWaypoint(waypoint, days);
        left = day == null
            ? back(Icons.u_turn_left, 'Retour')
            : goToDay(
                day,
                icon: Icons.u_turn_left,
                tooltip: 'Retour à la journée',
              );
        if (!mode.readOnly) {
          right = (
            icon: Icons.edit,
            tooltip: 'Déplacer l’étape',
            onPressed: () => ref.applyTransition(mode.editWaypoint(id)),
          );
        }
      case MapTrip():
        // Sa croix, au milieu, suffit : aucun autre bouton.
        break;
      default:
        left = back(Icons.map_outlined, 'Retour à la carte');
        // Rien d'ouvert : la fiche du voyage, à droite.
        right = (
          icon: TripReadyDock.infoIcon,
          tooltip: 'Informations du voyage',
          onPressed: () => ref.applyTransition(mode.showInfo),
        );
    }

    // Chaque enfant a sa clé : en retirer un (recherche) ou en ajouter un
    // (dialog) ne décale pas les autres, dont l'état est conservé.
    return Stack(
      fit: StackFit.expand,
      children: [
        // Jour, morceau, waypoint : la carte reste dégagée.
        if (!hideChrome)
          KeyedSubtree(
            key: const ValueKey('search'),
            // Un résultat de recherche pose le curseur et referme la fiche.
            child: SearchTopSheet(
              onPicked: mode.readOnly ? null : mode.placeCursorAt,
            ),
          ),
        // Une fiche ouverte (avec sa croix au milieu du dock) ou, à défaut,
        // retour à la carte et fiche du voyage.
        ?dialog,
        KeyedSubtree(
          key: const ValueKey('dock'),
          child: cursor != null
              // Mêmes propositions qu'en édition : tracer jusqu'ici, créer une
              // étape. La croix retire le curseur, comme le retour.
              ? EditDock(
                  panel: CursorPanel(
                    tripId: mode.tripId,
                    cursor: cursor,
                    canTrace: true,
                    canCreateWaypoint: true,
                    sketchTrace: true,
                    showClear: false,
                  ),
                  // Libre ou accroché à la route : deux panneaux différents.
                  panelKey: (
                    'cursor',
                    cursor.anchor == null ? 'free' : 'route',
                  ),
                  onBack: () => ref.applyTransition(mode.back),
                  onClose: () => ref.applyTransition(CursorActions.clear()),
                )
              : TripReadyDock(
                  left: left,
                  right: right,
                  onClose: infoOpen
                      ? () => ref.applyTransition(mode.closeSheet)
                      : null,
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
