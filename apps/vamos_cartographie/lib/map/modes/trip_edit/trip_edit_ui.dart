import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/cursor_panel.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/edit_span_panel.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/portion_preview_panel.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/select_route_panel.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/sketch/sketch_panel.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/waypoint/create_waypoint_panel.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/waypoint/selected_waypoint_panel.dart';
import 'package:vamos_cartographie/map/ui/chrome/dock/edit_dock.dart';

/// UI de toute la famille « édition du trip ».
///
/// Il n'y a plus de barre d'outils : on atteint les outils par la carte (le
/// curseur, la route, une étape). Reste un seul contrôle, [EditDock] : une
/// flèche retour en bas à gauche, dont le panneau est tiré vers la droite
/// (avec sa croix en haut) dès qu'un outil ou une action est ouvert.
///
/// Ne lit que ce qui décide du panneau : chaque panneau lit ses propres
/// données, pour que le dock ne se reconstruise pas à chaque changement de
/// tracé.
@Dependencies([modeSelection, ModeMachine])
class TripEditUi extends ConsumerWidget {
  const TripEditUi(this.mode, {super.key});

  final TripMode mode;

  /// Le panneau du mode courant, avec une clé qui change quand il faut
  /// l'échanger en fondu plutôt que le mettre à jour.
  (Widget?, Object?) _panel(
    MapObject? selection,
    SearchResultMarker? cursor,
  ) {
    final tripId = mode.tripId;
    return switch (mode) {
      // Outil de tracé : l'un des trois états partage un seul panneau.
      final SketchToolMode m => (SketchPanel(m), 'sketch'),
      final SelectRouteMode m => (SelectRoutePanel(m), 'select-route'),
      final PortionPreviewMode m => (PortionPreviewPanel(m), 'portion'),
      final EditSpanMode m => (EditSpanPanel(m), 'span'),
      final CreateWaypointMode m => (CreateWaypointPanel(m), 'create-waypoint'),
      // Sans outil : le curseur, ou l'étape sélectionnée.
      TripEditMode() when cursor != null => (
        CursorPanel(
          tripId: tripId,
          cursor: cursor,
          canTrace: true,
          canCreateWaypoint: true,
          sketchTrace: true,
          showClear: false, // la croix du dock s'en charge
        ),
        // Libre ou accroché à la route : deux panneaux différents.
        ('cursor', cursor.anchor == null ? 'free' : 'route'),
      ),
      final TripEditMode m when selection is MapWaypoint => (
        SelectedWaypointPanel(mode: m, waypoint: selection),
        ('waypoint', selection.id),
      ),
      _ => (null, null),
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cursor = ref.watch(modeSlotProvider(searchResultMarkerSlot));
    final selection = ref.watch(modeSelectionProvider);
    final (panel, panelKey) = _panel(selection, cursor);

    return Stack(
      fit: StackFit.expand,
      children: [
        // Un résultat de recherche pose le curseur et abandonne l'étape
        // sélectionnée.
        SearchTopSheet(
          onPicked: switch (mode) {
            final TripEditMode m => m.placeCursorAt,
            _ => null,
          },
        ),
        EditDock(
          panel: panel,
          panelKey: panelKey,
          // Comme le retour système : fermer le panneau d'abord, quitter
          // l'édition ensuite.
          onBack: () => ref.applyTransition(mode.back),
          onClose: () => ref.applyTransition(mode.closeTool),
        ),
      ],
    );
  }
}
