import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/domain_features/topology/injection/providers/graph_store.dart';
import '/domain_features/waypoint/waypoint.dart';
import '/map/camera/injection/map_camera_provider.dart';
part "map_editor_mode.g.dart";

@Riverpod(dependencies: [mapCamera])
class MapEditor extends _$MapEditor with ModeControllerMixin<MapEditorMode> {
  final _queue = EffectQueue();
  @override
  late EditTripCommandResolver resolver;

  @override
  MapEditorMode build(TripId tripId) {
    final graphEditor = ref.read(graphStoreProvider(tripId).notifier);
    final waypointEditor = ref.read(waypointStoreProvider(tripId).notifier);
    final mapCamera = ref.read(mapCameraProvider);
    resolver = EditTripCommandResolver(
      graphEditor: graphEditor,
      waypointEditor: waypointEditor,
      screenToLatLng: mapCamera.screenOffsetToLatLng,
    );
    final nbVertex = ref
        .read(graphStoreProvider(tripId))
        .vertexStore
        .store
        .length;
    if (nbVertex == 0) {
      return InitTripMode();
    }

    return IdleEditor();
  }

  @override
  MapEditorMode get mode => state;

  @override
  void setMode(MapEditorMode mode) {
    state = mode;
  }

  @override
  EffectQueue get effectQueue => _queue;
}
