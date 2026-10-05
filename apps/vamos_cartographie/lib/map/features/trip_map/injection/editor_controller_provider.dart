import 'package:domain_core/domain/collection_store.dart';
import 'package:map_controllers/map_controllers.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/map.dart';
part 'editor_controller_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapCamera])
class MapEditor extends _$MapEditor {
  late final MapEditorController controller;

  @override
  MapEditorMode build(TripId tripId) {
    print("MapEditor rebuild");
    final graphEditor = ref.watch(graphStoreProvider(tripId).notifier);
    final waypointEditor = ref.watch(waypointStoreProvider(tripId).notifier);
    final camera = ref.watch(mapCameraProvider);

    final MapEditorMode startMode =
        ref.read(vertexStoreProvider(tripId)).getIds().isEmpty
        ? const IdleEditor()
        : const InitTripMode();

    final commandResolver = MapCommandResolver(
      graphEditor: graphEditor,
      waypointEditor: waypointEditor,
    );

    controller = MapEditorController(
      commandResolver: commandResolver,
      camera: camera,
      onModeChanged: (mode) {
        state = mode;
      },
      initialMode: startMode,
    );

    return startMode;
  }

  void setMode(MapEditorMode mode) {
    state = mode;
  }
}
