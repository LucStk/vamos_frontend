// scene_composition.dart
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/mode_view.dart';
import 'package:vamos_cartographie/map/modes/route_edit/select_route/providers/selection_handle_provider.dart';
import 'package:vamos_cartographie/map/modes/route_edit/select_route/select_route_ui.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

SceneSpec selectRouteScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],

    (ref, cam) => ref.watch(allMobilityBadgeItemProvider(tripId, cam)),
    (ref, cam) => ref.watch(selectionHandleItemsProvider(tripId, cam)),
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
);

ModeView selectRouteView(SelectRouteMode m) =>
    ModeView(scene: selectRouteScene(m.tripId), ui: () => SelectRouteUi(m));
