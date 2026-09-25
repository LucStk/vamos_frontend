import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_editor_application/application/map_editor_controller.dart';
import 'package:map_editor_application/domain/map_editor_mode.dart';
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
      graphEditor: ref.watch(graphStoreProvider(tripId).notifier),
      waypointEditor: ref.watch(waypointStoreProvider(tripId).notifier),
      camera: ref.watch(mapCameraProvider),
      onModeChanged: (mode) {
        state = mode;
      },
    );

    return const Idle();
  }

  void setMode(MapEditorMode mode) {
    state = mode;
  }
}
