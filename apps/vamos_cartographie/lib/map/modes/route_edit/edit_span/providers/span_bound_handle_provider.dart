import 'dart:math';

import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/selection_handle_item.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/selection_highlightItem.dart';

part 'span_bound_handle_provider.g.dart';

/// Surlignage des portions déplacées et curseurs des deux bornes.
///
/// Pas `keepAlive` : ce provider ne vit que pendant le mode. Avec
/// `keepAlive`, chaque instance de [EditSpanMode] (clé de famille comparée
/// par identité) laisserait une entrée en cache jamais libérée.
@Riverpod(dependencies: [modeSlot])
List<SceneItem> spanBoundHandleItems(
  Ref ref,
  EditSpanMode mode,
  MapCameraReader camera,
) {
  final bounds = ref.watch(modeSlotProvider(spanBoundsSlot));
  final polyline = ref.watch(routePolylineProvider(mode.tripId, camera));
  if (bounds == null || polyline == null) return const [];

  // Une portion par borne : entre sa position d'origine et sa position
  // actuelle, dans l'ordre attendu par `sliceBetween`.
  final moved = [
    for (final (from, to) in [
      (mode.start, bounds.start),
      (mode.end, bounds.end),
    ])
      polyline.sliceBetween(min(from, to), max(from, to)),
  ];

  return [
    for (final slice in moved)
      if (slice.length >= 2)
        SelectionHighlightItem(
          object: SelectionHighlight(tripId: mode.tripId),
          points: slice,
        ),
    for (final bound in SpanBound.values)
      RouteHandleItem(
        object: SpanBoundHandle(
          tripId: mode.tripId,
          spanId: mode.mobilitySpanId,
          bound: bound,
        ),
        polyline: polyline,
        position: bounds[bound],
      ),
  ];
}
