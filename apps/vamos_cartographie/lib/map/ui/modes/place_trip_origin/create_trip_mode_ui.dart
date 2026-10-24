import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/shared/buttons/cancel_bottom_button.dart';

class CreateTripModeUi extends ConsumerWidget {
  const CreateTripModeUi(this.mode, {super.key});

  final CreateTripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    @Dependencies([modeSelection, ModeMachine])
    void createFrom(TripOriginMenu t) {
      final modeMachine = ref.read(modeMachineProvider);
      modeMachine.apply(t.validateOrigin());
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        CancelBottomButton(
          tooltipText: "Cancel creation",
          onPressed: () {
            ref.watch(modeMachineProvider).apply(ExploreMode.switchTo());
          },
        ),
        TripOriginMenuUi(validate: createFrom),
      ],
    );
  }
}
