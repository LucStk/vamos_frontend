import 'package:flutter/material.dart';

import 'package:vamos_cartographie/map/engine/map_back_scope.dart';
import 'package:vamos_cartographie/map/map_screen.dart';

/// Héberge l'unique MapScreen, monté une seule fois pour toute la vie de l'app.
/// Les pages (profil, login...) sont affichées PAR-DESSUS via [overlay].
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
        // Toujours en position 0 : jamais remonté. Le retour ne pilote les
        // modes que si la carte est la page affichée.
        MapBackScope(enabled: onMap, child: const MapScreen()),
        IgnorePointer(ignoring: onMap, child: overlay),
      ],
    );
  }
}
