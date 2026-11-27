import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/cursor_panel.dart';
import 'package:vamos_cartographie/map/modes/shared/mobility_type_menu.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/sketch/providers/sketch_mobility_type_provider.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/sketch/sketch_elevation.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/sketch/sketch_ways.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Panneau de l'outil « Tracer » ([SketchToolMode]) : le tracé
/// ([SketchEdition]), le calcul de l'itinéraire ([SketchGenerating]) et sa
/// prévisualisation ([SketchPreviewing]).
@Dependencies([modeSelection, ModeMachine])
class SketchPanel extends ConsumerWidget {
  const SketchPanel(this.mode, {super.key});

  final SketchToolMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) => switch (mode) {
    final SketchEdition m => _EditionPanel(m),
    final SketchPreviewing m => _PreviewPanel(m),
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
    final cursor = ref.watch(modeSlotProvider(searchResultMarkerSlot));

    // Un curseur : on propose d'y générer une route (depuis le crayon s'il y en
    // a un, depuis la fin de la route sinon), ou d'y créer une étape.
    if (cursor != null) {
      return CursorPanel(
        tripId: mode.tripId,
        cursor: cursor,
        canTrace: true,
        canCreateWaypoint: true,
        pencil: sketch,
        error: mode.failure?.message,
      );
    }

    // `validate` ignore un tracé sans segment : on désactive.
    final canValidate = sketch != null && sketch.hasSegment;

    return ToolPanel(
      error: mode.failure?.message,
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
          label: 'Effacer',
          destructive: true,
          onPressed: sketch == null
              ? null
              : () => ref.applyTransition(mode.clearTrace()),
        ),
      ],
      secondary: ToolAction(
        icon: Icons.alt_route,
        label: 'Calculer',
        onPressed: canValidate
            ? () => ref.applyTransition(mode.preview(mobilityType))
            : null,
      ),
      primary: ToolAction(
        icon: Icons.check,
        label: 'Ajouter',
        onPressed: canValidate
            ? () => ref.applyTransition(mode.validateFreehand(mobilityType))
            : null,
      ),
    );
  }
}

/// Itinéraire prévisualisé : le valider, le supprimer, revenir au tracé, en
/// demander un autre avec une autre mobilité, ou le prolonger jusqu'au curseur.
class _PreviewPanel extends ConsumerWidget {
  const _PreviewPanel(this.mode);

  final SketchPreviewing mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobilityType = ref.watch(sketchMobilityTypeProvider);
    final cursor = ref.watch(modeSlotProvider(searchResultMarkerSlot));

    // Un curseur : on propose d'y prolonger l'itinéraire, depuis le crayon.
    if (cursor != null) {
      return CursorPanel(
        tripId: mode.tripId,
        cursor: cursor,
        canTrace: true,
        pencil: ref.watch(modeSlotProvider(sketchTraceSlot)),
        error: mode.error?.message,
      );
    }

    final panel = ToolPanel(
      error: mode.error?.message,
      settings: [
        MobilityTypeMenu(
          selected: mobilityType,
          onChanged: (type) =>
              ref.read(sketchMobilityTypeProvider.notifier).select(type),
        ),
      ],
      trailing: [
        ToolAction(
          icon: Icons.refresh,
          label: 'Recalculer',
          onPressed: () => ref.applyTransition(mode.recalculate(mobilityType)),
        ),
        ToolAction(
          icon: Icons.delete_outline,
          label: 'Supprimer l’itinéraire',
          destructive: true,
          onPressed: () => ref.applyTransition(mode.delete()),
        ),
      ],
      secondary: ToolAction(
        icon: Icons.edit_outlined,
        label: 'Modifier le tracé',
        onPressed: () => ref.applyTransition(mode.backToSketch()),
      ),
      primary: ToolAction(
        icon: Icons.check,
        label: 'Ajouter',
        onPressed: () => ref.applyTransition(mode.commit()),
      ),
    );

    // Le profil d'élévation et le type de route, en bas du panneau.
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        panel,
        SketchElevation(
          tripId: mode.tripId,
          proposalId: mode.preview.proposalId,
          mobility: mobilityType,
        ),
        SketchWays(tripId: mode.tripId, proposalId: mode.preview.proposalId),
      ],
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
