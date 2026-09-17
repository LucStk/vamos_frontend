import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/topology/application/graph_editor.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:trip_application/waypoint/application/waypoint_editor.dart';
import 'package:vamos_cartographie/map/injection/injection.dart';
import 'package:vamos_cartographie/trip_map/effects/map_effect_resolver.dart';
import 'package:vamos_cartographie/trip_map/effects/map_effects.dart';
import 'package:vamos_cartographie/trip_map/trip_map.dart';
import 'package:vamos_cartographie/topology/injection/providers/providers.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_store.dart';

part 'map_effects.g.dart';

@riverpod
MapEffectContext? mapEffectContext(Ref ref, TripId tripId) {
  final MapCameraController? cameraController = ref.read(
    mapCameraControllerOrNullProvider,
  );
  if (cameraController == null) return null;

  final GraphEditor graphEditor = ref.read(graphStoreProvider(tripId).notifier);
  final WaypointEditor waypointEditor = ref.read(
    waypointStoreProvider(tripId).notifier,
  );

  final TripMapState mapState = ref.read(tripMapStateProvider(tripId));
  return MapEffectContext(
    graphEditor: graphEditor,
    mapState: mapState,
    camera: cameraController,
    waypointEditor: waypointEditor,
  );
}

@Riverpod(keepAlive: true)
class MapEffectResolverNotifier extends _$MapEffectResolverNotifier {
  @override
  void build(TripId tripId) {
    _tripId = tripId;
  }

  late final TripId _tripId;

  void resolve(MapEffectImpl effect) async {
    final context = ref.read(mapEffectContextProvider(_tripId));
    if (context == null) return null;
    final tripMapState = await MapEffectResolver.resolve(effect, context);
    if (tripMapState != null) {
      ref.read(tripMapStateProvider(_tripId).notifier).emit(tripMapState);
    }
  }
}
