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
    controller = MapEditorController(
      tripId: tripId,
      graphEditor: ref.watch(graphStoreProvider(tripId).notifier),
      waypointEditor: ref.watch(waypointStoreProvider(tripId).notifier),
      camera: ref.watch(mapCameraProvider),
      onModeChanged: (mode) {
        state = mode;
      },
    );

    return const IdleEditor();
  }

  void setMode(MapEditorMode mode) {
    state = mode;
  }
}
