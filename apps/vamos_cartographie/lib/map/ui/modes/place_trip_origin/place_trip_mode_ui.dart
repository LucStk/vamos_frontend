import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/modes/place_trip_origin/place_trip_menu_ui.dart';
import 'package:vamos_cartographie/map/ui/modes/place_trip_origin/trip_origin_menu_widget.dart';
import 'package:vamos_cartographie/map/ui/shared/buttons/cancel_bottom_button.dart';

class PlaceOriginTripModeUi extends ConsumerWidget {
  const PlaceOriginTripModeUi(this.mode, {super.key});

  final PlaceOriginTripMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    @Dependencies([modeSelection, ModeMachine])
    void validate(TripOriginMenu t) {
      final modeMachine = ref.read(modeMachineProvider);
      switch (mode) {
        case CreateTripMode _:
          modeMachine.apply(t.createTripWtOrigin());
        case MoveTripOriginMode _:
          modeMachine.apply(t.updateTripOrigin());
      }
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
        TripOriginMenuUi(validate: validate),
      ],
    );
  }
}
