import 'package:map_editor_application/application/map_editor_controller.dart';
import 'package:map_editor_application/domain/map_editor_mode.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/camera/camera.dart';
part 'editor_controller_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [MapCameraHolder])
MapEditorController mapEditorController(Ref ref, TripId tripId) {
  return MapEditorController(
    graphEditor: ref.watch(graphStoreProvider(tripId).notifier),
    waypointEditor: ref.watch(waypointStoreProvider(tripId).notifier),
    camera: ref.watch(mapCameraHolderProvider),
    onModeChanged: (mode) =>
        ref.read(editorModeProvider(tripId).notifier).setState = mode,
  );
}

@Riverpod(keepAlive: true)
class EditorModeNotifier extends _$EditorModeNotifier {
  @override
  MapEditorMode build(TripId tripId) => const Idle();
  set setState(MapEditorMode m) => state = m;
}
