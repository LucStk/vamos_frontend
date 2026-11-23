import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';

/// Les chiffres du trip (distance, jours, répartition des modalités),
/// recalculés quand la route, ses calques ou ses haltes changent.
final tripTravelStatsProvider = Provider.family<TripTravelStats, TripId>((ref, tripId) {
  final geometry = ref.watch(
    routeStoreProvider(tripId).select((s) => s.route?.current.geometry),
  );
  if (geometry == null || geometry.length < 2) return TripTravelStats.empty;

  return computeTripTravelStats(
    geometry: geometry,
    days: ref.watch(routeDaysProvider(tripId)),
    mobilitySpans: ref.watch(mobilitySpansProvider(tripId)),
    editSpans: ref.watch(editSpansProvider(tripId)),
  );
});
