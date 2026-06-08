import 'package:vamos_cartographie/features/topology/topology.dart';
import 'vertices_data.dart';

// 1. Le Helper magique
Segment createSegment({
  required int id,
  required SegmentType type,
  required int startId,
  required int endId,
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
  createSegment(id: 10, type: SegmentType.train, startId: 10, endId: 11),
  createSegment(id: 11, type: SegmentType.bike, startId: 11, endId: 12),
  createSegment(id: 12, type: SegmentType.bike, startId: 12, endId: 13),
  createSegment(id: 13, type: SegmentType.bike, startId: 13, endId: 14),
];

final List<Segment> t2Segments = [
  createSegment(id: 21, type: SegmentType.bike, startId: 21, endId: 22),
  createSegment(id: 22, type: SegmentType.bike, startId: 22, endId: 23),
  createSegment(id: 23, type: SegmentType.walk, startId: 23, endId: 24),
  createSegment(id: 24, type: SegmentType.bike, startId: 24, endId: 25),
];

final List<Segment> t3Segments = [
  createSegment(id: 31, type: SegmentType.bike, startId: 30, endId: 31),
  createSegment(id: 32, type: SegmentType.bike, startId: 31, endId: 32),
  createSegment(id: 33, type: SegmentType.bike, startId: 32, endId: 33),
];
final segmentMockData = [...t1Segments, ...t2Segments, ...t3Segments];
