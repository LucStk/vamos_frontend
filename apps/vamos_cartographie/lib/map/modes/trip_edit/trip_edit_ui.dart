import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/mode_toolbox.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/providers/sketch_mobility_type_provider.dart';

@Dependencies([modeSelection, ModeMachine])
class TripEditUi extends ConsumerWidget {
  const TripEditUi(this.mode, {super.key});

  final RouteEditMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobilityType = ref.watch(sketchMobilityTypeProvider);
    final sketch = ref.watch(modeSlotProvider(sketchTraceSlot));

    return ModeToolbox(tools: [],)
  }
}
