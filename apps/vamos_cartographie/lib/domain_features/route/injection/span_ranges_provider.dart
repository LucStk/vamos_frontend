import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:trip_application/trip_application.dart";
import "package:vamos_cartographie/domain_features/route/injection/route_store.dart";

part "span_ranges_provider.g.dart";

/// Vertex de début et de fin de chaque span du calque modalité.
@Riverpod(keepAlive: true)
Map<SpanId, VertexRange> mobilitySpanRanges(Ref ref, TripId tripId) {
  final store = ref.watch(routeStoreProvider(tripId));
  final route = store.route?.current;
  if (route == null) return const {};

  return computeSpanRanges(
    store.mobilitySpans.store.values.map((n) => n.current),
    route.geometry.length,
  );
}

/// Étendue de chaque span du calque modalité.
@Riverpod(keepAlive: true)
Map<SpanId, SpanExtent> mobilitySpanExtents(Ref ref, TripId tripId) {
  final store = ref.watch(routeStoreProvider(tripId));
  final route = store.route?.current;
  if (route == null) return const {};

  return computeSpanExtents(
    store.mobilitySpans.store.values.map((n) => n.current),
    route.geometry.length,
  );
}

/// Vertex de début et de fin de chaque span du calque d'édition.
@Riverpod(keepAlive: true)
Map<SpanId, VertexRange> editSpanRanges(Ref ref, TripId tripId) {
  final store = ref.watch(routeStoreProvider(tripId));
  final route = store.route?.current;
  if (route == null) return const {};

  return computeSpanRanges(store.editSpans, route.geometry.length);
}
