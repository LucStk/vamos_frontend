import 'package:map_editor_application/application/map_editor_controller.dart';
import 'package:map_editor_application/domain/map_editor_mode.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/base_map/base_map.dart';
import 'package:vamos_cartographie/topology/injection/providers/graph_store.dart';
import 'package:vamos_cartographie/waypoint/injection/waypoint_store.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'editor_controller_provider.g.dart';

@Riverpod(keepAlive: true)
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
