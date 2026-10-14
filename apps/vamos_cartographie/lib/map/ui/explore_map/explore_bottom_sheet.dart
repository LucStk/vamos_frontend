// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/ui/explore_map/bottom_sheet/bottom_sheet.dart';

@Dependencies([modeSelection])
class ExploreBottomSheet extends ConsumerWidget {
  const ExploreBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Avec ConsumerState, ref est accessible directement dans toute la classe via "ref"
    final selection = ref.watch(modeSelectionProvider);

    switch (selection) {
      case MapTrip e:
        return TripBottomSheet(tripId: e.id);
      case _:
        return CreateTripBottomSheet();
    }
  }
}
