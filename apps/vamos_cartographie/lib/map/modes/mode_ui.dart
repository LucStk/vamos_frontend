// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/recent_trips_provider.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';

@Dependencies([ModeMachine])
class ModeUi extends ConsumerWidget {
  const ModeUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(mapModeProvider);

    // Entrer dans un voyage le fait entrer dans les « récents » du panneau de
    // compte. Ici parce que c'est le seul endroit qui voit tous les chemins
    // d'ouverture (clic sur la carte, profil, favoris, récents) ; le voyage
    // est déjà chargé à ce stade (`ResolveTripEntry`), donc son titre est là.
    ref.listen(mapModeProvider, (previous, next) {
      if (next is! TripMode) return;
      // Édition, outil, panneau : on reste dans le même voyage.
      if (previous is TripMode && previous.tripId == next.tripId) return;

      ref
          .read(recentTripsProvider.notifier)
          .remember(
            next.tripId,
            ref.read(tripProvider(next.tripId))?.title ?? '',
          );
    });

    return viewFor(mode).ui();
  }
}
