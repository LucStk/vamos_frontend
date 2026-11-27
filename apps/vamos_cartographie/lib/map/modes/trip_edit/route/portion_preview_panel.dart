import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/mobility_type_menu.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Panneau contextuel de [PortionPreviewMode] : valider le re-routage de la
/// portion, revenir à la sélection, ou le recalculer avec une autre mobilité.
@Dependencies([modeSelection, ModeMachine])
class PortionPreviewPanel extends ConsumerStatefulWidget {
  const PortionPreviewPanel(this.mode, {super.key});

  final PortionPreviewMode mode;

  @override
  ConsumerState<PortionPreviewPanel> createState() =>
      _PortionPreviewPanelState();
}

class _PortionPreviewPanelState extends ConsumerState<PortionPreviewPanel> {
  /// Choix de l'utilisateur ; null : la mobilité du calcul affiché.
  MobilityType? _chosen;

  @override
  Widget build(BuildContext context) {
    final mode = widget.mode;

    // Annuler : la réponse du calcul sera ignorée (le mode ne correspondra
    // plus), et la sélection est retrouvée.
    if (mode.isLoading) {
      return _LoadingPanel(
        onCancel: () => ref.applyTransition(mode.backToSelection()),
      );
    }

    final mobility = _chosen ?? mode.mobilityType;
    return ToolPanel(
      error: mode.error?.message,
      settings: [
        MobilityTypeMenu(
          selected: mobility,
          onChanged: (type) => setState(() => _chosen = type),
        ),
      ],
      trailing: [
        ToolAction(
          icon: Icons.refresh,
          label: 'Recalculer',
          onPressed: () => ref.applyTransition(mode.recalculate(mobility)),
        ),
      ],
      secondary: ToolAction(
        icon: Icons.edit_outlined,
        label: 'Modifier la sélection',
        onPressed: () => ref.applyTransition(mode.backToSelection()),
      ),
      primary: ToolAction(
        icon: Icons.check,
        label: 'Ajouter',
        onPressed: () => ref.applyTransition(mode.commit()),
      ),
    );
  }
}

class _LoadingPanel extends StatelessWidget {
  const _LoadingPanel({required this.onCancel});

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const SizedBox.square(
        dimension: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(
          'Calcul de l’itinéraire…',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      TextButton(onPressed: onCancel, child: const Text('Annuler')),
    ],
  );
}
