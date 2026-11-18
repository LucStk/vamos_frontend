import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_ranges_provider.dart';
import 'package:vamos_cartographie/domain_features/waypoint/injection/waypoint_queries.dart';
// + routeStoreProvider, mobilitySpanExtentsProvider, et le provider qui expose
//   les waypoints d'un trip (adaptez son nom).

part 'day_providers.g.dart';

/// Les journées de déplacement du trip, recalculées quand les haltes ou la
/// géométrie changent.
@Riverpod(keepAlive: true)
List<RouteDay> routeDays(Ref ref, TripId tripId) {
  final vertexCount = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.geometry.length),
  );
  if (vertexCount == null || vertexCount < 2) return const [];

  final waypointIds = ref.watch(allWaypointIdsProvider(tripId)); // adaptez
  final waypoints = waypointIds.map(
    (m) => ref.watch(waypointProvider(tripId, m)),
  ); // adaptez
  return computeRouteDays(waypoints, routeEnd: (vertexCount - 1).toDouble());
}

/// Un jour, retrouvé par sa halte d'arrivée. Freezed : `.select` ne reconstruit
/// que si CE jour change (borne ou numéro).
@Riverpod(keepAlive: true)
RouteDay? routeDay(Ref ref, TripId tripId, WaypointId? endsAt) => ref.watch(
  routeDaysProvider(
    tripId,
  ).select((days) => days.where((d) => d.endsAt == endsAt).firstOrNull),
);

/// Les tronçons de modalité d'un jour.
@Riverpod(keepAlive: true)
DayRuns? dayRuns(Ref ref, TripId tripId, WaypointId? endsAt) {
  final day = ref.watch(routeDayProvider(tripId, endsAt));
  if (day == null || !day.hasGeometry) return null;

  final mobility = ref.watch(mobilitySpanExtentsProvider(tripId));
  return DayRuns(mobilityRunsIn((from: day.from, to: day.to), mobility));
}
