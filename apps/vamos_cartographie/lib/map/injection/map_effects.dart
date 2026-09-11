import 'package:map_application/domain/map_editor_state.dart';
import 'package:map_application/effects/map_effects.dart';
import 'package:map_application/map_camera_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/topology/application/graph_editor.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';
import 'package:vamos_cartographie/map/injection/map_editor_state.dart';
import 'package:vamos_cartographie/map/map.dart';
import 'package:vamos_cartographie/topology/injection/providers/providers.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_store.dart';

// Généré automatiquement par riverpod_generator
part 'map_effects.g.dart';

@Riverpod(keepAlive: true)
class MapEffectsNotifier extends _$MapEffectsNotifier implements MapEffects {
  @override
  void build(TripId tripId) {
    _tripId = tripId;
  }

  late final TripId _tripId;

  @override
  WaypointEditor get waypointEditor =>
      ref.read(waypointStoreProvider(_tripId).notifier);

  @override
  GraphEditor get graphEditor => ref.read(graphStoreProvider(_tripId).notifier);

  @override
  MapCameraController? get cameraController =>
      ref.read(mapCameraControllerOrNullProvider);

  @override
  MapEditorState get mapState => ref.read(mapEditorStateProvider(_tripId));

  @override
  set mapState(MapEditorState value) {
    ref.read(mapEditorStateProvider(_tripId).notifier).state = value;
  }
}
