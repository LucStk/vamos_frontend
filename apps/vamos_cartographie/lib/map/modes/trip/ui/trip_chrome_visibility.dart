import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';

/// Vrai quand la lecture d'un voyage montre la fiche d'un jour, d'un de ses
/// morceaux ou d'un waypoint : la carte doit alors rester dégagée (ni
/// recherche, ni zoom, ni localisation).
///
/// Écrit à la main (pas de génération) : sans `build_runner`.
final tripDialogHidesChromeProvider = Provider<bool>((ref) {
  if (ref.watch(mapModeProvider) is! TripReadyMode) return false;
  return switch (ref.watch(modeSelectionProvider)) {
    MapDaySegment() || MapDayRun() || MapWaypoint() => true,
    _ => false,
  };
});
