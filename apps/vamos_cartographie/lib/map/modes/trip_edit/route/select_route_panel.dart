import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Panneau contextuel de [SelectRouteMode] (ouvert par un glissement sur la
/// route, sans onglet).
///
/// Le mode ne propose encore aucune action sur la sélection : seul « Fermer »
/// est branché. Ajoutez les actions ici quand le mode les exposera.
@Dependencies([modeSelection, ModeMachine])
class SelectRoutePanel extends ConsumerWidget {
  const SelectRoutePanel(this.mode, {super.key});

  final SelectRouteMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ToolPanel(
      hint: 'Ajustez les poignées pour choisir la portion de route.',
      secondary: ToolAction(
        icon: Icons.close,
        label: 'Fermer',
        onPressed: () =>
            ref.applyTransition(Transition.to(TripEditMode(mode.tripId))),
      ),
      // primary: ToolAction(
      //   icon: Icons.check,
      //   label: '…',
      //   onPressed: () => ref.applyTransition(mode.<action>()),
      // ),
    );
  }
}
