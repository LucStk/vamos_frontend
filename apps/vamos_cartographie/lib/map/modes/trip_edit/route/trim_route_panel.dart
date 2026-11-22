import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Panneau contextuel de [TrimRouteMode] : supprimer la portion entre
/// l'extrémité saisie et le curseur.
@Dependencies([modeSelection, ModeMachine])
class TrimRoutePanel extends ConsumerWidget {
  const TrimRoutePanel(this.mode, {super.key});

  final TrimRouteMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(modeSlotProvider(routeSelectionSlot));
    // ADAPTEZ : getter supposé de RouteSelection.
    final hasPortion = selection != null && !selection.isCollapsed;

    final (what, hint) = switch (mode.end) {
      RouteEnd.start => (
        'le début',
        'Faites glisser le curseur pour choisir où la route commencera.',
      ),
      RouteEnd.end => (
        'la fin',
        'Faites glisser le curseur pour choisir où la route s’arrêtera.',
      ),
    };

    return ToolPanel(
      hint: hasPortion ? null : hint,
      secondary: ToolAction(
        icon: Icons.close,
        label: 'Annuler',
        onPressed: () => ref.applyTransition(mode.back),
      ),
      primary: ToolAction(
        icon: Icons.content_cut,
        label: 'Supprimer $what',
        destructive: true,
        confirmation: ToolConfirmation(
          title: 'Supprimer $what de la route ?',
          message: 'La portion surlignée sera retirée de l’itinéraire.',
          confirmLabel: 'Supprimer',
        ),
        onPressed: hasPortion
            ? () => ref.applyTransition(mode.deleteSelection())
            : null,
      ),
    );
  }
}
