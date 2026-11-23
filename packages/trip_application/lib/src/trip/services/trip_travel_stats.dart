import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/day/domain/route_day.dart';
import 'package:trip_application/src/route/domain/mobility_types.dart';
import 'package:trip_application/src/route/domain/spans/edit_span.dart';
import 'package:trip_application/src/route/domain/spans/mobility_span.dart';

/// Ce que le trip a fait avec UNE modalité.
class MobilityShare {
  const MobilityShare({
    required this.mobility,
    required this.days,
    required this.distanceM,
    required this.drawnM,
  });

  final MobilityType mobility;

  /// Part de jours de déplacement passée avec cette modalité. Un jour qui en
  /// mélange plusieurs se répartit au prorata de la distance parcourue ce
  /// jour-là : 12 km à pied et 36 km à vélo font 0,25 jour de marche et
  /// 0,75 jour de vélo.
  final double days;

  /// Distance totale parcourue avec cette modalité, en mètres.
  final double distanceM;

  /// Dont tracée à main levée (non routée), en mètres.
  final double drawnM;

  /// Dont tracée par le calcul d'itinéraire, en mètres.
  double get routedM => distanceM - drawnM;

  /// Distance moyenne par jour passé avec cette modalité, en mètres.
  double? get metersPerDay => days > 0 ? distanceM / days : null;

  /// Part de la distance tracée à main levée (0..1) ; null sans distance.
  double? get drawnRatio => distanceM > 0 ? drawnM / distanceM : null;
}

/// Les chiffres d'un trip, dérivés de sa route : jamais stockés.
class TripTravelStats {
  const TripTravelStats({
    required this.totalDistanceM,
    required this.totalDays,
    required this.travelDays,
    required this.shares,
  });

  static const empty = TripTravelStats(
    totalDistanceM: 0,
    totalDays: 0,
    travelDays: 0,
    shares: [],
  );

  final double totalDistanceM;

  /// Durée du voyage, jours passés sur place compris.
  final int totalDays;

  /// Jours où l'on se déplace (ceux qui ont une géométrie) : la base du
  /// camembert des modalités.
  final int travelDays;

  /// Une entrée par modalité utilisée, la plus présente d'abord.
  final List<MobilityShare> shares;

  bool get isEmpty => totalDistanceM <= 0;

  double get sharesTotalDays => shares.fold(0.0, (sum, s) => sum + s.days);
}

/// Calcule le [TripTravelStats] d'une route.
///
/// [geometry] : la polyline. [days] : ses journées (`computeRouteDays`), de
/// même repère que les spans (indices de sommets, fractions comprises).
/// [mobilitySpans] et [editSpans] : les calques de la route ; un calque vide
/// vaut « modalité par défaut » / « tracé calculé ».
TripTravelStats computeTripTravelStats({
  required List<LatLng> geometry,
  required List<RouteDay> days,
  required Iterable<MobilitySpanFields> mobilitySpans,
  required Iterable<EditSpan> editSpans,
}) {
  if (geometry.length < 2) return TripTravelStats.empty;

  const metric = Distance(roundResult: false);
  final cumulative = List<double>.filled(geometry.length, 0);
  for (var i = 1; i < geometry.length; i++) {
    cumulative[i] =
        cumulative[i - 1] + metric.distance(geometry[i - 1], geometry[i]);
  }
  final lastVertex = (geometry.length - 1).toDouble();

  /// Distance depuis le départ à la position [pos] (sommet + fraction).
  double at(double pos) {
    final p = pos.clamp(0.0, lastVertex);
    final i = min(p.floor(), geometry.length - 2);
    return cumulative[i] + (cumulative[i + 1] - cumulative[i]) * (p - i);
  }

  final mobility = [...mobilitySpans]
    ..sort((a, b) => a.startIndex.compareTo(b.startIndex));
  final edits = [...editSpans]
    ..sort((a, b) => a.startIndex.compareTo(b.startIndex));

  MobilityType mobilityAt(double pos) {
    var type = mobility.isEmpty ? MobilityType.bike : mobility.first.mobilityType;
    for (final s in mobility) {
      if (s.startIndex > pos) break;
      type = s.mobilityType;
    }
    return type;
  }

  bool drawnAt(double pos) {
    var drawn = false;
    for (final s in edits) {
      if (s.startIndex > pos) break;
      drawn = s.geometrySource == GeometrySource.drawn;
    }
    return drawn;
  }

  final daysBy = <MobilityType, double>{};
  final distance = <MobilityType, double>{};
  final drawn = <MobilityType, double>{};
  var travelDays = 0;

  for (final day in days) {
    if (!day.hasGeometry) continue;
    final dayLength = at(day.to) - at(day.from);
    if (dayLength <= 0) continue;
    travelDays++;

    // Les bornes qui découpent ce jour : ses extrémités et, à l'intérieur,
    // chaque changement de modalité ou de source de tracé.
    final cuts = <double>{
      day.from,
      day.to,
      for (final s in mobility)
        if (s.startIndex > day.from && s.startIndex < day.to)
          s.startIndex.toDouble(),
      for (final s in edits)
        if (s.startIndex > day.from && s.startIndex < day.to)
          s.startIndex.toDouble(),
    }.toList()..sort();

    for (var i = 0; i < cuts.length - 1; i++) {
      final a = cuts[i], b = cuts[i + 1];
      final length = at(b) - at(a);
      if (length <= 0) continue;
      final mid = (a + b) / 2;
      final type = mobilityAt(mid);
      distance[type] = (distance[type] ?? 0) + length;
      daysBy[type] = (daysBy[type] ?? 0) + length / dayLength;
      if (drawnAt(mid)) drawn[type] = (drawn[type] ?? 0) + length;
    }
  }

  final shares = [
    for (final type in distance.keys)
      MobilityShare(
        mobility: type,
        days: daysBy[type] ?? 0,
        distanceM: distance[type]!,
        drawnM: drawn[type] ?? 0,
      ),
  ]..sort((a, b) => b.days.compareTo(a.days));

  return TripTravelStats(
    totalDistanceM: at(lastVertex),
    totalDays: days.isEmpty ? 0 : days.last.number,
    travelDays: travelDays,
    shares: shares,
  );
}
