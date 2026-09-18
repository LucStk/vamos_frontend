import 'package:map_application/base/domain/base_controller.dart';
import 'package:map_application/map_editor/domain/domain.dart';
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
  BaseMode build(TripId tripId) => const BaseMode();
  set setState(BaseMode m) => state = m;
}
