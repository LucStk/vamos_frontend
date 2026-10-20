import 'package:trip_application/src/route/domain/route_section.dart';

typedef VertexRange = ({int first, int last});

Map<SectionId, VertexRange> computeSectionRanges(
  Iterable<RouteSectionFields> sections,
  int vertexCount,
) {
  final sorted = sections.toList()
    ..sort((a, b) => a.startIndex.compareTo(b.startIndex));
  final lastVertex = vertexCount - 1;

  final ranges = <SectionId, VertexRange>{};
  for (var i = 0; i < sorted.length; i++) {
    final first = sorted[i].startIndex;
    final last = i + 1 < sorted.length ? sorted[i + 1].startIndex : lastVertex;
    ranges[sorted[i].id] = (first: first, last: last);
  }
  return ranges;
}
