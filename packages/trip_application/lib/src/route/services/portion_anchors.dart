import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:trip_application/src/route/domain/mobility_types.dart';
import 'package:trip_application/src/route/domain/route_anchor.dart';
import 'package:trip_application/src/route/domain/spans/spans.dart';

/// Les deux bornes d'une portion de route, dans le sens de la route.
typedef RoutePortion = ({SectionAnchor start, SectionAnchor end});

/// Ancres des bornes de la portion entre les positions continues [from] et
/// [to], dans n'importe quel ordre. Une position suit le repère de
/// `RouteHitDetail.position` : partie entière = index du sommet, partie
/// décimale = avancement vers le suivant.
///
/// [mobilitySpans] doit être trié par `startIndex`. Retourne null si la route
/// n'a pas d'arête ou pas de span.
RoutePortion? portionAnchors({
  required List<LatLng> geometry,
  required List<MobilitySpanFields> mobilitySpans,
  required double from,
  required double to,
}) {
  final edges = _portionEdges(geometry.length, from, to);
  if (edges == null || mobilitySpans.isEmpty) return null;
  return (
    start: SectionAnchor(
      sectionId: mobilitySpans.containingEdge(edges.first).id,
      position: _pointAt(geometry, min(from, to)),
    ),
    end: SectionAnchor(
      sectionId: mobilitySpans.containingEdge(edges.last).id,
      position: _pointAt(geometry, max(from, to)),
    ),
  );
}

/// Modalités traversées par la portion, dans l'ordre de la route, sans
/// doublon. Vide si la route n'a pas d'arête.
List<MobilityType> portionMobilities({
  required int vertexCount,
  required List<MobilitySpanFields> mobilitySpans,
  required double from,
  required double to,
}) {
  final edges = _portionEdges(vertexCount, from, to);
  if (edges == null) return const [];
  final result = <MobilityType>[];
  for (var i = 0; i < mobilitySpans.length; i++) {
    final firstEdge = mobilitySpans[i].startIndex;
    // Un span couvre les arêtes de son début jusqu'au début du suivant.
    final lastEdge =
        mobilitySpans.endVertexOf(i, lastVertex: vertexCount - 1) - 1;
    if (firstEdge <= edges.last && lastEdge >= edges.first) {
      final mobility = mobilitySpans[i].mobilityType;
      if (!result.contains(mobility)) result.add(mobility);
    }
  }
  return result;
}

/// Arêtes (de `i` à `i + 1`) touchées par la portion. Une borne posée
/// exactement sur un sommet appartient à l'arête qui la précède pour la fin,
/// à celle qui la suit pour le début.
({int first, int last})? _portionEdges(
  int vertexCount,
  double from,
  double to,
) {
  final lastEdge = vertexCount - 2;
  if (lastEdge < 0) return null;
  final first = max(0, min(min(from, to).floor(), lastEdge));
  final last = max(first, min(max(from, to).ceil() - 1, lastEdge));
  return (first: first, last: last);
}

LatLng _pointAt(List<LatLng> geometry, double position) {
  final lastVertex = geometry.length - 1;
  final p = max(0.0, min(position, lastVertex.toDouble()));
  final i = p.floor();
  if (i >= lastVertex) return geometry[lastVertex];
  final t = p - i;
  final a = geometry[i];
  final b = geometry[i + 1];
  return LatLng(
    a.latitude + t * (b.latitude - a.latitude),
    a.longitude + t * (b.longitude - a.longitude),
  );
}
