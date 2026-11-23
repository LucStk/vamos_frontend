import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/cursor_panel.dart';
import 'package:vamos_cartographie/map/modes/shared/mode_toolbox.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/edit_span_panel.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/portion_preview_panel.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/select_route_panel.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/sketch/sketch_panel.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_tab.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/toolbox.dart';

/// UI de toute la famille « édition du trip » :
/// - outils (onglets) : créer quelque chose de nouveau ;
/// - actions contextuelles (gestes sur un objet de la carte, sans onglet).
///
/// Ne lit aucun provider de contenu : chaque panneau lit les siens, pour que
/// la boîte à outils ne se reconstruise pas à chaque changement de tracé.
@Dependencies([modeSelection, ModeMachine])
class TripEditUi extends ConsumerWidget {
  const TripEditUi(this.mode, {super.key});

  final TripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripId = mode.tripId;
    final cursor = ref.watch(modeSlotProvider(searchResultMarkerSlot));

    return Stack(
      fit: StackFit.expand,
      children: [
        const SearchTopSheet(),
        ModeToolbox(
          mode: mode,
          closed: () => TripEditMode(tripId),
          leading: BackTab(onTap: () => ref.applyTransition(mode.back)),
          // Croix de chaque panneau : retour à l'édition du trip (ici, elle
          // retire le curseur), la flèche retour sortant vers la lecture.
          onClose: () => ref.applyTransition(mode.closeTool),
          tools: [
            // <SketchToolMode> : l'onglet reste allumé pendant le calcul
            // (SketchGenerating), et le panneau suit le sous-mode.
            ModeTool<SketchToolMode>(
              item: const ToolboxItem(
                icon: Icons.draw_outlined,
                selectedIcon: Icons.draw,
                label: 'Tracer',
              ),
              open: () => SketchEdition(tripId),
              panel: (m) => SketchPanel(m),
            ),
          ],
          contextual: [
            ModePanel<SelectRouteMode>((m) => SelectRoutePanel(m)),
            ModePanel<PortionPreviewMode>((m) => PortionPreviewPanel(m)),
            ModePanel<EditSpanMode>((m) => EditSpanPanel(m)),
            // Sans outil actif, toucher la carte y pose le curseur : on propose
            // d'y créer une étape ou d'y tracer la suite de la route.
            if (cursor != null)
              ModePanel<TripEditMode>(
                (m) => CursorPanel(
                  tripId: tripId,
                  cursor: cursor,
                  canTrace: true,
                  canCreateWaypoint: true,
                  sketchTrace: true,
                  showClear: false, // la croix du panneau s'en charge
                ),
              ),
          ],
        ),
      ],
    );
  }
}
