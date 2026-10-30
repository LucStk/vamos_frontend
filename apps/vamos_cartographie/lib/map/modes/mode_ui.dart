// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';
import 'package:vamos_cartographie/map/modes/explore/ui/trip_read_only_ui.dart';
import 'package:vamos_cartographie/map/modes/place_origin/ui/place_origin_ui.dart';
import 'package:vamos_cartographie/map/modes/sketch_mode/ui/sketch_mode_ui.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/trip_edit_mode_ui.dart';

@Dependencies([modeSelection, ModeMachine])
class ModeUi extends ConsumerWidget {
  const ModeUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(modeStateProvider.select((m) => m.mode));

    return switch (mode) {
      TripReadOnlyMode t => TripReadOnlyUi(t),
      SketchEdition t => SketchModeUi(t),
      TripEditMode t => TripEditModeUi(t),
      PlaceOriginMode t => PlaceOriginUi(t),
      _ => SizedBox.shrink(),
    };
  }
}
