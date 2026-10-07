// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

import '../injection/explore_mode.dart';
import 'bottom_sheet/create_trip_bottom_sheet.dart';
import 'bottom_sheet/trip_bottom_sheet.dart';
import '/map/injection/map_scene.dart';
import "/map/injection/map_gesture_handler.dart";

@Dependencies([mapScene, MapGestureHandlerNotifier])
class ExploreBottomSheet extends ConsumerWidget {
  const ExploreBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Avec ConsumerState, ref est accessible directement dans toute la classe via "ref"
    final mode = ref.watch(mapExploreProvider);

    switch (mode) {
      case TripSelectMode e:
        return TripBottomSheet(tripId: e.trip.id);
      case _:
        return CreateTripBottomSheet();
    }
  }
}
