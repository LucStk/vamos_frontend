import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';

/// Vrai quand la carte doit rester dégagée (ni recherche, ni zoom, ni
/// localisation) : la lecture d'un voyage montre la fiche d'un jour, d'un de
/// ses morceaux ou d'un waypoint, ou bien l'on choisit une portion de route.
///
/// Écrit à la main (pas de génération) : sans `build_runner`.
final tripDialogHidesChromeProvider = Provider<bool>((ref) {
  return switch (ref.watch(mapModeProvider)) {
    SelectRouteMode() || PortionPreviewMode() => true,
    TripReadyMode() => switch (ref.watch(modeSelectionProvider)) {
      MapDaySegment() || MapDayRun() || MapWaypoint() => true,
      _ => false,
    },
    _ => false,
  };
});
