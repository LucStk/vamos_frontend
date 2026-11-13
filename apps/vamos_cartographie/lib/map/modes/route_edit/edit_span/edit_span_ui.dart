import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/route_edit/providers/sketch_mobility_type_provider.dart';
import 'package:vamos_cartographie/map/modes/route_edit/ui/widgets/bottom_sheet/contextual/sheet_sketch.dart';
import 'package:vamos_cartographie/map/modes/shared/chrome/edit_bottom_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class EditSpanUi extends ConsumerWidget {
  const EditSpanUi(this.mode, {super.key});

  final EditSpanMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EditBottomSheet(
      // Retour : quitte le mode sans valider (ancien « Cancel creation »).
      onBack: () => ref
          .read(appModeMachineProvider.notifier)
          .apply(Transition.to(RouteEditMode(mode.tripId))),

      onClearRoute: null,
      contextualSheet: Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Material(
            // color: colors.surface,
            // surfaceTintColor: colors.surfaceTint,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(9),
              child: Row(
                children: [
                  IconButton(
                    tooltip: 'Retour',
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    tooltip: 'Effacer le tracé',
                    onPressed: () {},
                    icon: const Icon(Icons.backspace_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
