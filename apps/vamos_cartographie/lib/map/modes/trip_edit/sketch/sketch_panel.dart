import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/mobility_type_menu.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/sketch/providers/sketch_mobility_type_provider.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Panneau de l'outil « Tracer » ([SketchToolMode]) : le tracé
/// ([SketchEdition]) et le calcul de l'itinéraire ([SketchGenerating]).
@Dependencies([modeSelection, ModeMachine])
class SketchPanel extends ConsumerWidget {
  const SketchPanel(this.mode, {super.key});

  final SketchToolMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) => switch (mode) {
    final SketchEdition m => _EditionPanel(m),
    // Annuler : la réponse du calcul sera ignorée (le jeton ne correspondra
    // plus), et SketchEdition retrouve le tracé (slot conservé).
    _ => _GeneratingPanel(
      onCancel: () =>
          ref.applyTransition(Transition.to(SketchEdition(mode.tripId))),
    ),
  };
}

class _EditionPanel extends ConsumerWidget {
  const _EditionPanel(this.mode);

  final SketchEdition mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sketch = ref.watch(modeSlotProvider(sketchTraceSlot));
    final mobilityType = ref.watch(sketchMobilityTypeProvider);

    // `validate` ignore un tracé de moins de deux points : on désactive.
    final canValidate = sketch != null && sketch.points.length >= 2;

    return ToolPanel(
      hint: sketch == null
          ? 'Faites glisser depuis la route pour tracer la suite.'
          : null,
      settings: [
        MobilityTypeMenu(
          selected: mobilityType,
          onChanged: (type) =>
              ref.read(sketchMobilityTypeProvider.notifier).select(type),
        ),
      ],
      trailing: [
        ToolAction(
          icon: Icons.backspace_outlined,
          label: 'Effacer le tracé',
          destructive: true,
          onPressed: sketch == null
              ? null
              : () =>
                    ref.applyTransition(Transition.set(sketchTraceSlot, null)),
        ),
      ],
      primary: ToolAction(
        icon: Icons.alt_route,
        label: 'Calculer l’itinéraire',
        onPressed: canValidate
            ? () => ref.applyTransition(mode.validate(mobilityType))
            : null,
      ),
    );
  }
}

class _GeneratingPanel extends StatelessWidget {
  const _GeneratingPanel({required this.onCancel});

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
