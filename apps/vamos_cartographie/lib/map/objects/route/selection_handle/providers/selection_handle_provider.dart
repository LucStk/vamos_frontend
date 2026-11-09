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
    for (final side in HandleSide.values)
      () {
        final pos = side == HandleSide.start ? selection.start : selection.end;
        final (min, max) = switch (side) {
          HandleSide.start => (0.0, selection.end),
          HandleSide.end => (selection.start, polyline.maxPosition),
        };
        return SelectionHandleItem(
          position: pos,
          polyline: polyline,
          object: SelectionHandle(tripId: tripId, side: side),
          max: max,
          min: min,
        );
      }(),
  ];
}
