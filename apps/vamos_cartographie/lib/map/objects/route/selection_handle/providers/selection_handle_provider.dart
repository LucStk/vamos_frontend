import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/selection_handle_item.dart';

part 'selection_handle_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [modeSlot])
List<SceneItem> selectionHandleItems(
  Ref ref,
  TripId tripId,
  MapCameraReader camera,
) {
  final selection = ref.watch(modeSlotProvider(routeSelectionSlot));
  final polyline = ref.watch(routePolylineProvider(tripId, camera));
  if (selection == null || polyline == null) return const [];

  return [
    for (final id in HandleId.values)
      SelectionHandleItem(
        object: SelectionHandle(tripId: tripId, id: id),
        polyline: polyline,
        position: switch (id) {
          HandleId.a => selection.a,
          HandleId.b => selection.b,
        },
      ),
  ];
}
