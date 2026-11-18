// map/modes/mode_view.dart
import 'package:flutter/cupertino.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/modes/explore/explore_view.dart';
import 'package:vamos_cartographie/map/modes/place_origin/place_origin_view.dart';
import 'package:vamos_cartographie/map/modes/route_edit/edit_span/edit_span_view.dart';
import 'package:vamos_cartographie/map/modes/route_edit/select_route/select_route_view.dart';
import 'package:vamos_cartographie/map/modes/route_edit/sketch/sketch_view.dart';
import 'package:vamos_cartographie/map/modes/trip_ready/trip_view.dart';
import 'package:vamos_cartographie/map/modes/waypoints_edit/waypoint_views.dart';
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

ModeView viewFor(AppMode mode) => switch (mode) {
  ExploreMode t => exploreView(t),
  EditSpanMode t => editSpanView(t),

  PlaceNewTripOrigin m => placeNewTripOriginView(m),
  PlaceExistingTripOrigin m => placeExistingTripOriginView(m),

  CreateWaypointMode m => createWaypointView(m),
  WaypointsEditMode m => editWaypointsView(m),
  SelectRouteMode m => selectRouteView(m),
  SketchEdition m => sketchEditionView(m),
  SketchGenerating m => sketchGeneratingView(m),

  TripReadyMode m => tripReadyView(m),
  _ => ModeView.empty,
};
