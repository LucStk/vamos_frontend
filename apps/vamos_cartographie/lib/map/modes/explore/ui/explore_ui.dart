import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/search_top_sheet.dart';
import 'package:vamos_cartographie/map/ui/chrome/explore_bottom_bar.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';

@Dependencies([modeSelection, ModeMachine])
class ExploreUi extends ConsumerWidget {
  const ExploreUi(this.mode, {super.key});

  final ExploreMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        SearchTopSheet(),

        SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: ConstrainedBox(
                // Évite une barre immense en format PC
                constraints: const BoxConstraints(maxWidth: 480),
                child: ExploreBottomBar(
                  selectedIndex: 0, // TODO : à relier à un provider
                  onSelected: (i) {
                    // 0 = Carte (déjà là). Index 3 = Personnes.
                    if (i == 3) const UserSearchRoute().push(context);
                    // TODO : Recherche et Favoris
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
