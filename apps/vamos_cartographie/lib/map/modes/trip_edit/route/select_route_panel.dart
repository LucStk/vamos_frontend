import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/mobility_type_menu.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Panneau contextuel de [SelectRouteMode] (ouvert par un glissement sur la
/// route, sans onglet) : re-router la portion sélectionnée, avec ou sans
/// changement de mobilité, ou la supprimer quand elle part d'une extrémité.
@Dependencies([modeSelection, ModeMachine])
class SelectRoutePanel extends ConsumerStatefulWidget {
  const SelectRoutePanel(this.mode, {super.key});

  final SelectRouteMode mode;

  @override
  ConsumerState<SelectRoutePanel> createState() => _SelectRoutePanelState();
}

class _SelectRoutePanelState extends ConsumerState<SelectRoutePanel> {
  /// Choix de l'utilisateur ; null tant qu'il n'a pas touché au menu : on
  /// propose alors la mobilité de la portion.
  MobilityType? _chosen;

  @override
  Widget build(BuildContext context) {
    final mode = widget.mode;
    final selection = ref.watch(modeSlotProvider(routeSelectionSlot));
    final hasPortion = selection != null && !selection.isCollapsed;

    final spans = ref.watch(mobilitySpansProvider(mode.tripId));
    final vertexCount = ref.watch(
      routeStoreProvider(
        mode.tripId,
      ).select((s) => s.route?.current.geometry.length ?? 0),
    );
    // Modalités sous la sélection (ou sous le point, si elle est fermée).
    final underSelection = selection == null
        ? const <MobilityType>[]
        : portionMobilities(
            vertexCount: vertexCount,
            mobilitySpans: spans,
            from: selection.start,
            to: selection.end,
          );
    final mobility =
        _chosen ??
        (underSelection.isEmpty ? MobilityType.bike : underSelection.first);
    // Même mobilité partout sous la sélection : rien à changer, et le serveur
    // n'a pas à y couper un span de plus.
    final changesMobility = underSelection.any((m) => m != mobility);
    // Un curseur sur le départ ou l'arrivée : la portion peut être retirée.
    final trimEnd = selection?.reachedEnd(vertexCount);

    return ToolPanel(
      error: mode.failure?.message,
      // Toujours une ligne de texte, courte : le panneau garde sa hauteur
      // quand la portion apparaît (sinon il s'ouvre grand puis rétrécit).
      hint: hasPortion ? 'Portion sélectionnée.' : 'Ajustez les poignées.',
      settings: [
        MobilityTypeMenu(
          selected: mobility,
          onChanged: (type) => setState(() => _chosen = type),
        ),
      ],
      trailing: [
        if (trimEnd != null)
          ToolAction(
            icon: Icons.content_cut,
            label: switch (trimEnd) {
              RouteEnd.start => 'Supprimer le début',
              RouteEnd.end => 'Supprimer la fin',
            },
            destructive: true,
            confirmation: ToolConfirmation(
              title: switch (trimEnd) {
                RouteEnd.start => 'Supprimer le début de la route ?',
                RouteEnd.end => 'Supprimer la fin de la route ?',
              },
              message: 'La portion surlignée sera retirée de l’itinéraire.',
              confirmLabel: 'Supprimer',
            ),
            onPressed: () => ref.applyTransition(mode.trim(trimEnd)),
          ),
      ],
      secondary: ToolAction(
        icon: Icons.gesture,
        label: 'Garder le tracé',
        onPressed: hasPortion && changesMobility
            ? () => ref.applyTransition(mode.keepTrace(mobility))
            : null,
      ),
      primary: ToolAction(
        icon: Icons.alt_route,
        label: 'Re-router',
        onPressed: hasPortion
            ? () => ref.applyTransition(mode.preview(mobility))
            : null,
      ),
    );
  }
}
