import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/selection_handle_item.dart';

part 'span_bound_handle_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [modeSlot])
List<SceneItem> spanBoundHandleItems(
  Ref ref,
  TripId tripId,
  MobilitySpanId spanId,
  MapCameraReader camera,
) {
  final bounds = ref.watch(modeSlotProvider(spanBoundsSlot));
  final polyline = ref.watch(routePolylineProvider(tripId, camera));
  if (bounds == null || polyline == null) return const [];

  // Pas de surlignage ici : le segment sélectionné porte déjà le trait
  // `selected`.
  return [
    for (final bound in SpanBound.values)
      RouteHandleItem(
        object: SpanBoundHandle(tripId: tripId, spanId: spanId, bound: bound),
        polyline: polyline,
        position: bounds[bound],
      ),
  ];
}
