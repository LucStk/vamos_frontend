import 'package:domain_core/domain_core.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';

part 'span_queries.g.dart';

// --- Calque modalité -----------------------------------------------------------

@Riverpod(keepAlive: true)
GraphNode<MobilitySpanFields> mobilitySpanNode(
  Ref ref,
  TripId tripId,
  MobilitySpanId id,
) {
  final node = ref.watch(
    routeStoreProvider(tripId).select((s) => s.mobilitySpans.get(id)),
  );
  if (node == null) {
    throw Exception(
      NotFoundFailure(resourceType: "mobilitySpanNode", resourceId: "$id"),
    );
  }
  return node;
}

@Riverpod(keepAlive: true)
MobilitySpanFields mobilitySpan(Ref ref, TripId tripId, MobilitySpanId id) {
  return ref.watch(
    mobilitySpanNodeProvider(tripId, id).select((n) => n.current),
  );
}

/// Spans de modalité triés par `startIndex` : l'ordre de la route.
///
/// Ne se recalcule que si la collection change : un patch de la route seule
/// (titre…) ne relance pas le tri.
@Riverpod(keepAlive: true)
List<MobilitySpanFields> mobilitySpans(Ref ref, TripId tripId) {
  final collection = ref.watch(
    routeStoreProvider(tripId).select((s) => s.mobilitySpans),
  );
  return [...collection.store.values.map((n) => n.current)]
    ..sort((a, b) => a.startIndex.compareTo(b.startIndex));
}

// --- Calque d'édition ----------------------------------------------------------

/// Spans d'édition, déjà triés par `RouteStore`. Mode édition seulement.
@Riverpod(keepAlive: true)
List<EditSpan> editSpans(Ref ref, TripId tripId) {
  return ref.watch(routeStoreProvider(tripId).select((s) => s.editSpans));
}
