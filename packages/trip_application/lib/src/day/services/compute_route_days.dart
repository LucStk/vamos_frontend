import 'dart:math';

import 'package:flutter/foundation.dart'
    show listEquals; // ou package:collection
import 'package:trip_application/src/day/domain/route_day.dart';
import 'package:trip_application/src/route/domain/spans/route_span.dart';
import 'package:trip_application/src/route/domain/spans/span_extent.dart';
import 'package:trip_application/src/waypoint/domain/waypoint_model.dart';

/// Les journées de déplacement d'une route, dans l'ordre.
///
/// Un jour va de la halte précédente (ou du départ) à la halte suivante (ou à
/// l'arrivée). Une halte de `nights` nuits occupe `nights` numéros : le jour
/// d'arrivée, puis `nights - 1` jours sur place, sans géométrie.
///
/// [routeEnd] : position de la fin de la route, dans le repère de
/// `anchorPosition` (ex. `geometry.length - 1`).
List<RouteDay> computeRouteDays(
  Iterable<WaypointFields> waypoints, {
  required double routeEnd,
}) {
  final stops = [
    for (final w in waypoints)
      if (w.stay != null) w,
  ]..sort((a, b) => a.anchorPosition.compareTo(b.anchorPosition));

  final days = <RouteDay>[];
  var from = 0.0;
  var number = 1;
  for (final w in stops) {
    days.add(
      RouteDay(number: number, from: from, to: w.anchorPosition, endsAt: w.id),
    );
    number += w.stay!.nights;
    from = w.anchorPosition;
  }
  days.add(RouteDay(number: number, from: from, to: routeEnd));
  return days;
}

typedef RouteRange = ({double from, double to});

/// Morceau d'un jour qui a une seule modalité (donc une seule couleur).
typedef MobilityRun = ({SpanId mobilityId, RouteRange range});

/// Les tronçons d'un jour, avec égalité par valeur (une `List` brute serait
/// toujours « différente » pour `.select`).
final class DayRuns {
  const DayRuns(this.runs);
  final List<MobilityRun> runs;

  @override
  bool operator ==(Object other) =>
      other is DayRuns && listEquals(other.runs, runs);

  @override
  int get hashCode => Object.hashAll(runs);
}

/// Intersection d'un jour avec les tronçons de modalité. Les tronçons se
/// touchent et couvrent exactement le jour ; un tronçon qui ne fait que le
/// toucher en un point est ignoré.
List<MobilityRun> mobilityRunsIn(
  RouteRange day,
  Map<SpanId, SpanExtent> mobility,
) {
  final runs = <MobilityRun>[];
  for (final MapEntry(:key, :value) in mobility.entries) {
    final from = max(value.start.vertex.toDouble(), day.from);
    final to = min(value.end.vertex.toDouble(), day.to);
    if (from < to) runs.add((mobilityId: key, range: (from: from, to: to)));
  }
  runs.sort((a, b) => a.range.from.compareTo(b.range.from));
  return runs;
}
