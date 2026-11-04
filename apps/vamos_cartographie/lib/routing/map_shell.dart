import 'package:flutter/material.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/map_screen.dart';
import 'package:vamos_cartographie/map/interaction/map_gesture_handler.dart';
import 'package:vamos_cartographie/map/interaction/visual_target.dart';
import 'package:vamos_cartographie/map/scene/map_scene.dart';

/// Héberge l'unique MapScreen, monté une seule fois pour toute la vie de l'app.
/// Les pages (profil, login...) sont affichées PAR-DESSUS via [overlay].
@Dependencies([mapScene, visualTargets, MapGestureHandlerNotifier])
class MapShell extends StatelessWidget {
  const MapShell({super.key, required this.onMap, required this.overlay});

  /// `true` quand la page courante est la carte : le Navigator laisse alors
  /// passer les touches jusqu'à la carte.
  final bool onMap;
  final Widget overlay;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        IgnorePointer(ignoring: onMap, child: overlay),
        const MapScreen(), // toujours en position 0 : jamais remonté
      ],
    );
  }
}
