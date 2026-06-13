import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/topology/topology.dart';
import 'vertices_data.dart';

// 1. Le Helper magique
Segment createSegment({
  required Id<Segment> id,
  required SegmentType type,
  required Id<Vertex> startId,
  required Id<Vertex> endId,
}) {
  return Segment(
    id: id,
    type: type,
    startVertexId: startId,
    endVertexId: endId,
    geometry: [vertexMapMock[startId]!.latLng, vertexMapMock[endId]!.latLng],
  );
}

// 2. Vos listes deviennent infiniment plus propres et lisibles :
final List<Segment> t1Segments = [
  createSegment(
    id: Id<Segment>(10),
    type: SegmentType.train,
    startId: Id<Vertex>(10),
    endId: Id<Vertex>(11),
  ),
  createSegment(
    id: Id<Segment>(11),
    type: SegmentType.bike,
    startId: Id<Vertex>(11),
    endId: Id<Vertex>(12),
  ),
  createSegment(
    id: Id<Segment>(12),
    type: SegmentType.bike,
    startId: Id<Vertex>(12),
    endId: Id<Vertex>(13),
  ),
  createSegment(
    id: Id<Segment>(13),
    type: SegmentType.bike,
    startId: Id<Vertex>(13),
    endId: Id<Vertex>(14),
  ),
];

final List<Segment> t2Segments = [
  createSegment(
    id: Id<Segment>(21),
    type: SegmentType.bike,
    startId: Id<Vertex>(21),
    endId: Id<Vertex>(22),
  ),
  createSegment(
    id: Id<Segment>(22),
    type: SegmentType.bike,
    startId: Id<Vertex>(22),
    endId: Id<Vertex>(23),
  ),
  createSegment(
    id: Id<Segment>(23),
    type: SegmentType.walk,
    startId: Id<Vertex>(23),
    endId: Id<Vertex>(24),
  ),
  createSegment(
    id: Id<Segment>(24),
    type: SegmentType.bike,
    startId: Id<Vertex>(24),
    endId: Id<Vertex>(25),
  ),
];

final List<Segment> t3Segments = [
  createSegment(
    id: Id<Segment>(31),
    type: SegmentType.bike,
    startId: Id<Vertex>(30),
    endId: Id<Vertex>(31),
  ),
  createSegment(
    id: Id<Segment>(32),
    type: SegmentType.bike,
    startId: Id<Vertex>(31),
    endId: Id<Vertex>(32),
  ),
  createSegment(
    id: Id<Segment>(33),
    type: SegmentType.bike,
    startId: Id<Vertex>(32),
    endId: Id<Vertex>(33),
  ),
];

final segmentMockData = [...t1Segments, ...t2Segments, ...t3Segments];
