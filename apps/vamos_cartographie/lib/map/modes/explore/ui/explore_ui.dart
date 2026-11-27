import 'package:flutter/cupertino.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/explore/ui/trip_cards.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';

@Dependencies([modeSelection, ModeMachine])
class ExploreUi extends ConsumerWidget {
  const ExploreUi(this.mode, {super.key});

  final ExploreMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // La barre du bas (`ExploreBottomBar`) est mise de côté : la recherche et
    // le compte passent par les deux boutons en haut à gauche.
    return Stack(
      children: [
        SearchTopSheet(),
        const Align(alignment: Alignment.bottomCenter, child: TripCards()),
      ],
    );
  }
}
