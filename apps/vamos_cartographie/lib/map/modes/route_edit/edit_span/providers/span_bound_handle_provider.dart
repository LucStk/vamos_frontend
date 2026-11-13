import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
// Fichier où vivent routeStoreProvider et mobilitySpanExtentsProvider :
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_polyline_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/selection_handle_item.dart';
import 'package:vamos_cartographie/map/objects/route/selection_handle/selection_highlightItem.dart';

part 'span_bound_handle_provider.g.dart';

/// Surlignage de la portion déplacée et curseurs des deux bornes.
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
  // Brouillon : null tant qu'aucune borne n'a été déplacée.
  final draft = ref.watch(modeSlotProvider(spanBoundsSlot));

  // Positions d'origine : lues dans les providers, plus dans le mode.
  final range = ref.watch(
    mobilitySpanExtentsProvider(
      mode.tripId,
    ).select((m) => m[mode.mobilitySpanId]?.vertices),
  );
  final polyline = ref.watch(routePolylineProvider(mode.tripId, camera));
  if (range == null || polyline == null) return const [];

  double originOf(SpanBound bound) => switch (bound) {
    SpanBound.start => range.first.toDouble(),
    SpanBound.end => range.last.toDouble(),
  };

  // Position courante : le brouillon pour la borne déplacée, l'origine pour
  // l'autre.
  double currentOf(SpanBound bound) => switch (draft) {
    SpanBounds(bound: final moved, :final value) when moved == bound => value,
    _ => originOf(bound),
  };

  // Une seule borne peut être déplacée : au plus une portion, entre sa
  // position d'origine et sa position actuelle, dans l'ordre attendu par
  // `sliceBetween`.
  final slice = draft == null
      ? null
      : polyline.sliceBetween(
          min(originOf(draft.bound), draft.value),
          max(originOf(draft.bound), draft.value),
        );

  return [
    if (slice != null && slice.length >= 2)
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
        position: currentOf(bound),
      ),
  ];
}
