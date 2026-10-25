// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/modes/edit_trip/sketch_mode/sketch_mode_ui.dart';
import 'package:vamos_cartographie/map/ui/modes/edit_trip/trip_mode_ui.dart';
import 'package:vamos_cartographie/map/ui/modes/place_origin/place_origin_ui.dart';

@Dependencies([modeSelection, ModeMachine])
class MapUi extends ConsumerWidget {
  const MapUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(modeStateProvider.select((m) => m.mode));

    return switch (mode) {
      ExploreMode _ => SizedBox.shrink(),
      SketchEdition t => SketchModeUi(t),
      TripMode t => TripModeUi(t),
      PlaceOriginMode t => PlaceOriginUi(t),
      _ => SizedBox.shrink(),
    };
  }
}
