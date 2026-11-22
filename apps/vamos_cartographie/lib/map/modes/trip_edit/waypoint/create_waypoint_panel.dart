import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

class CreateWaypointPanel extends ConsumerWidget {
  const CreateWaypointPanel(this.mode, {super.key});

  final CreateWaypointMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pending = ref.watch(modeSlotProvider(pendingWaypointSlot));
    final hasPoint = pending != null;

    return ToolPanel(
      // Consigne seulement tant qu'aucun point n'est posé.
      hint: hasPoint ? null : 'Touchez la carte pour poser un point.',
      primary: ToolAction(
        icon: Icons.task_alt,
        label: 'Valider la position',
        // null : bouton désactivé (grisé, non cliquable).
        onPressed: hasPoint
            ? () => ref.applyTransition(mode.validatePosition())
            : null,
      ),
    );
  }
}
