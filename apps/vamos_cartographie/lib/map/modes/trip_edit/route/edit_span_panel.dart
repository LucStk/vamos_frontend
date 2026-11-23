import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/mobility_type_menu.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Panneau contextuel de [EditSpanMode] (ouvert en touchant un tronçon de
/// la route, sans onglet) : modalité du tronçon et ajustement de ses bornes.
@Dependencies([modeSelection, ModeMachine])
class EditSpanPanel extends ConsumerWidget {
  const EditSpanPanel(this.mode, {super.key});

  final EditSpanMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Brouillon : null tant qu'aucune borne n'a été déplacée.
    final draft = ref.watch(modeSlotProvider(spanBoundsSlot));
    final mobilityType = ref.watch(
      mobilitySpanProvider(
        mode.tripId,
        mode.mobilitySpanId,
      ).select((m) => m.mobilityType),
    );

    return ToolPanel(
      hint: draft == null
          ? 'Faites glisser une borne pour ajuster le tronçon.'
          : null,
      settings: [
        MobilityTypeMenu(
          selected: mobilityType,
          onChanged: (type) {
            // TODO : ref.applyTransition(mode.setMobilityType(type)),
            // une fois la méthode ajoutée à EditSpanMode.
          },
        ),
      ],
      secondary: ToolAction(
        icon: Icons.close,
        label: draft == null ? 'Fermer' : 'Annuler',
        onPressed: () =>
            ref.applyTransition(mode.closeTool),
      ),
      primary: const ToolAction(
        icon: Icons.check,
        label: 'Valider les bornes',
        // TODO : une fois `validateBounds()` ajouté à EditSpanMode :
        // onPressed: draft == null
        //     ? null
        //     : () => ref.applyTransition(mode.validateBounds()),
        onPressed: null,
      ),
    );
  }
}
