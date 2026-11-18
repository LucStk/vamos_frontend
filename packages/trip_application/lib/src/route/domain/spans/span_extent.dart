// À placer à côté de computeSpanRanges / mobilitySpanRanges

import 'package:trip_application/trip_application.dart';

/// Nature d'une borne de span : ce qu'il y a de l'autre côté.
sealed class BoundKind {
  const BoundKind();
}

/// Début de la route : aucun span avant.
final class RouteStartBound extends BoundKind {
  const RouteStartBound();
}

/// Fin de la route : aucun span après.
final class RouteEndBound extends BoundKind {
  const RouteEndBound();
}

/// Jonction avec un autre span : la déplacer déplace aussi la borne
/// correspondante de [neighbor].
final class JunctionBound extends BoundKind {
  const JunctionBound(this.neighbor);
  final SpanId neighbor;

  // Égalité par valeur : le provider recrée ces objets à chaque recalcul, et
  // `.select((m) => m[id])` les compare avec `==`.
  @override
  bool operator ==(Object other) =>
      other is JunctionBound && other.neighbor == neighbor;

  @override
  int get hashCode => Object.hash(JunctionBound, neighbor);
}

/// Où se trouve une borne (indice de sommet de la route) et sa nature.
typedef BoundPoint = ({int vertex, BoundKind kind});

/// Les deux bornes d'un span. Records : égalité par valeur gratuite.
typedef SpanExtent = ({BoundPoint start, BoundPoint end});

extension SpanExtentX on SpanExtent {
  /// Même information que l'ancien [VertexRange], pour découper la géométrie.
  VertexRange get vertices => (first: start.vertex, last: end.vertex);
}

/// Étendue de chaque span : sommets de début et de fin, et nature des bornes.
///
/// Suppose que les spans couvrent toute la route sans trou, comme
/// [computeSpanRanges] : le premier span commence la route, le dernier la
/// termine, et chaque autre borne touche le span voisin.
Map<SpanId, SpanExtent> computeSpanExtents(
  Iterable<RouteSpanFields> sections,
  int vertexCount,
) {
  final sorted = sections.toList()
    ..sort((a, b) => a.startIndex.compareTo(b.startIndex));
  final lastVertex = vertexCount - 1;

  final extents = <SpanId, SpanExtent>{};
  for (var i = 0; i < sorted.length; i++) {
    final previous = i > 0 ? sorted[i - 1] : null;
    final next = i + 1 < sorted.length ? sorted[i + 1] : null;

    extents[sorted[i].id] = (
      start: (
        vertex: sorted[i].startIndex,
        kind: previous == null
            ? const RouteStartBound()
            : JunctionBound(previous.id),
      ),
      end: (
        vertex: next?.startIndex ?? lastVertex,
        kind: next == null ? const RouteEndBound() : JunctionBound(next.id),
      ),
    );
  }
  return extents;
}
