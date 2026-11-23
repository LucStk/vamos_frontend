import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/day/injection/run_note_providers.dart';
import 'package:vamos_cartographie/domain_features/day/providers/day_providers.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/route/injection/span_queries.dart';
import 'package:vamos_cartographie/map/modes/shared/helpers/section_slice.dart';

/// Ce qu'on sait d'un morceau de journée, calculé depuis la route affichée.
///
/// Le dénivelé n'y est pas : la route ne porte pas encore d'altitudes.
typedef RunStats = ({double distanceM, MobilityType mobility});

/// Suit le morceau [key] ; null si le jour n'a plus ce span (route modifiée
/// depuis l'ouverture de la fiche).
RunStats? watchRunStats(WidgetRef ref, RunKey key) {
  final run = ref
      .watch(dayRunsProvider(key.tripId, key.endsAt))
      ?.runs
      .where((r) => r.mobilityId == key.spanId)
      .firstOrNull;
  final geometry = ref.watch(
    routeStoreProvider(key.tripId).select((s) => s.route?.current.geometry),
  );
  if (run == null || geometry == null) return null;

  final slice = sliceBetweenPositions(geometry, run.range.from, run.range.to);
  final mobility = ref.watch(
    mobilitySpanProvider(
      key.tripId,
      MobilitySpanId(key.spanId.value),
    ).select((m) => m.mobilityType),
  );
  return (distanceM: slice == null ? 0 : _lengthM(slice), mobility: mobility);
}

/// Longueur en mètres de la route entre deux positions (indices de sommets,
/// fractions comprises) ; 0 si la section est dégénérée.
double lengthBetween(List<LatLng> geometry, double from, double to) {
  final slice = sliceBetweenPositions(geometry, from, to);
  return slice == null ? 0 : _lengthM(slice);
}

double _lengthM(List<LatLng> points) {
  const distance = Distance(roundResult: false);
  var total = 0.0;
  for (var i = 0; i < points.length - 1; i++) {
    total += distance.distance(points[i], points[i + 1]);
  }
  return total;
}

/// « 850 m », « 12,4 km ».
String formatDistance(double meters) => meters < 1000
    ? '${meters.round()} m'
    : '${(meters / 1000).toStringAsFixed(1).replaceAll('.', ',')} km';
