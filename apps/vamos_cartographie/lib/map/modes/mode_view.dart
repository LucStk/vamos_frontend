// map/modes/mode_view.dart
import 'package:flutter/widgets.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/explore/explore_view.dart';
import 'package:vamos_cartographie/map/modes/place_origin/place_origin_view.dart';
import 'package:vamos_cartographie/map/modes/trip/trip_view.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/edit_span_scene.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/route/select_route_scene.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/sketch/sketch_scene.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/trip_edit_view.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/waypoint/waypoint_scene.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

final class ModeView {
  const ModeView({required this.scene, required this.ui});
  final SceneSpec scene;
  final Widget Function() ui;

  /// Aucune couche propre au mode, aucune UI.
  static const empty = ModeView(
    scene: SceneSpec(layers: []),
    ui: _none,
  );
  static Widget _none() => const SizedBox.shrink();
}

/// Un seul endroit pour savoir ce qu'affiche chaque mode.
///
/// Famille « édition du trip » : tous ses modes passent par [tripEditView],
/// qui garde la même UI (la boîte à outils) ; seule la scène change.
ModeView viewFor(AppMode mode) => switch (mode) {
  ExploreMode m => exploreView(m),

  PlaceNewTripOrigin m => placeNewTripOriginView(m),
  PlaceExistingTripOrigin m => placeExistingTripOriginView(m),

  TripReadyMode m => tripReadyView(m),

  // --- Édition du trip -----------------------------------------------------
  // Aucun outil actif : on voit la route et les étapes, on peut les toucher.
  TripEditMode m => tripEditView(m, createWaypointScene(m.tripId)),
  // Outils (onglets).
  CreateWaypointMode m => tripEditView(m, createWaypointScene(m.tripId)),
  SketchEdition m => tripEditView(m, sketchScene(m.tripId)),
  SketchGenerating m => tripEditView(m, sketchGeneratingScene(m.tripId)),
  // Actions contextuelles (gestes sur la route).
  SelectRouteMode m => tripEditView(m, selectRouteScene(m.tripId)),
  EditSpanMode m => tripEditView(m, editSpanScene(m)),

  _ => ModeView.empty,
};
