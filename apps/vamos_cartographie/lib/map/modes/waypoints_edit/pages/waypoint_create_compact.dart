import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:map_engine/map_engine.dart';

/// UI partagée par [WaypointsEditMode] (aucun onglet ouvert) et ses
/// sous-modes, un par onglet. Tous l'affichent : la sheet est conservée.
class WaypointCreateCompact extends ConsumerWidget {
  const WaypointCreateCompact({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "Poser un nouveau point sur la carte",
        style: TextStyle(color: CupertinoColors.systemGrey),
      ),
    );
  }
}
