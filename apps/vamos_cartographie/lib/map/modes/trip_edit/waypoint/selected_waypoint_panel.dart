import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Panneau de l'étape sélectionnée en édition : pour l'instant, la supprimer.
class SelectedWaypointPanel extends ConsumerWidget {
  const SelectedWaypointPanel({
    super.key,
    required this.remove,
  });

  /// Ce que fait la suppression de l'étape (propre au mode qui affiche le
  /// panneau).
  final Transition remove;

  @override
  Widget build(BuildContext context, WidgetRef ref) => ToolPanel(
    hint: 'Glissez l’étape ou son ancre pour l’ajuster.',
    primary: ToolAction(
      icon: Icons.delete_outline,
      label: 'Supprimer l’étape',
      destructive: true,
      confirmation: const ToolConfirmation(
        title: 'Supprimer cette étape ?',
        message: 'Elle disparaît du voyage, ainsi que sa halte éventuelle.',
        confirmLabel: 'Supprimer',
      ),
      onPressed: () => ref.applyTransition(remove),
    ),
  );
}
