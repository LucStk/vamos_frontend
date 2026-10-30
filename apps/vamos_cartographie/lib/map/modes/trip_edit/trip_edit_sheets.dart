import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/ui/trip/header/trip_header.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/buttons/edit_bottom_button.dart';

import 'package:vamos_cartographie/map/ui/shared/sheets/floating_header_card.dart';

@Dependencies([modeSelection, ModeMachine])
class TripEditSheets extends ConsumerWidget {
  const TripEditSheets(this.mode, {super.key});

  final TripEditMode mode;

  static const double _barHeight = 56;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripRequiredProvider(mode.tripId));

    return SafeArea(
      child: Stack(
        children: [
          // Barre centrée dans l'écran
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: FloatingHeaderCard(
                child: TripHeader(title: trip.title, canEdit: true),
              ),
            ),
          ),

          // Bouton retour, aligné sur le même niveau
          Positioned(
            top: 0,
            left: 0,
            height: _barHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () =>
                    ref.applyTransition(Transition.to(ExploreMode())),
              ),
            ),
          ),
          EditBottomButton(
            tooltipText: "Edit route",
            onPressed: () {
              ref
                  .read(appModeMachineProvider.notifier)
                  .apply(Transition.to(SketchEdition(mode.tripId)));
            },
          ),
        ],
      ),
    );
  }
}
