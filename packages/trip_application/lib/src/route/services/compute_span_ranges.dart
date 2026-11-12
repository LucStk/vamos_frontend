import 'package:trip_application/src/route/domain/spans/spans.dart';

typedef VertexRange = ({int first, int last});

Map<SpanId, VertexRange> computeSpanRanges(
  Iterable<RouteSpanFields> sections,
  int vertexCount,
) {
  final sorted = sections.toList()
    ..sort((a, b) => a.startIndex.compareTo(b.startIndex));
  final lastVertex = vertexCount - 1;

  final ranges = <SpanId, VertexRange>{};
  for (var i = 0; i < sorted.length; i++) {
    final first = sorted[i].startIndex;
    final last = i + 1 < sorted.length ? sorted[i + 1].startIndex : lastVertex;
    ranges[sorted[i].id] = (first: first, last: last);
  }
  return ranges;
}
