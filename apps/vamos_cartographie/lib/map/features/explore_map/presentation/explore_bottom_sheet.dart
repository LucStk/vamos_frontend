// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/map.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([MapExplore])
class ExploreBottomSheet extends ConsumerWidget {
  const ExploreBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Avec ConsumerState, ref est accessible directement dans toute la classe via "ref"
    final mode = ref.watch(mapExploreProvider);

    switch (mode.selection) {
      case MapTripObject e:
        return TripBottomSheet(tripId: e.id);

      case null:
        return SizedBox.shrink();
    }
  }
}
