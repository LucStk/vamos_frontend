import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode_machine/helpers/mode_apply.dart';
import 'package:vamos_cartographie/map/mode_machine/map_mode.dart';
import 'package:vamos_cartographie/map/modes/shared/ui/trip/header/trip_header.dart';

import 'package:vamos_cartographie/map/ui/shared/sheets/floating_header_card.dart';

@Dependencies([modeSelection, ModeMachine])
class TripModeSheetUi extends ConsumerWidget {
  const TripModeSheetUi(this.mode, {super.key});

  final TripEditableMode mode;

  static const double _barHeight = 56;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Stack(
        children: [
          // Contenu : décalé sous la barre, bornes de hauteur préservées
          Positioned.fill(
            top: _barHeight,
            child: switch (mode) {
              TripActiveMode e => FloatingHeaderCard(
                child: TripHeader(title: e.title, canEdit: true),
              ),
              _ => const SizedBox.shrink(),
            },
          ),

          // "AppBar" : juste le bouton retour, en haut à gauche
          Positioned(
            top: 0,
            left: 0,
            height: _barHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () =>
                    ref.applyTransition(Transition.to(ExploreMode())),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
