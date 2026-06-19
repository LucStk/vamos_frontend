import 'package:vamos_cartographie/packages/topology_engine/lib/domain/domain.dart';
import 'vertices_data.dart';

import 'package:domain_core/domain_core.dart';

// 1. Le Helper magique
Segment createSegment({
  required Id<Segment> id,
  required MobilityType type,
  required Id<Vertex> startId,
  required Id<Vertex> endId,
}) {
  return Segment(
    id: id,
    mobilityType: type,
    startVertexId: startId,
    endVertexId: endId,
    geometry: [vertexMapMock[startId]!.latLng, vertexMapMock[endId]!.latLng],
  );
}

// 2. Vos listes deviennent infiniment plus propres et lisibles :
final List<Segment> t1Segments = [
  createSegment(
    id: Id<Segment>(10),
    type: MobilityType.train,
    startId: Id<Vertex>(10),
    endId: Id<Vertex>(11),
  ),
  createSegment(
    id: Id<Segment>(11),
    type: MobilityType.bike,
    startId: Id<Vertex>(11),
    endId: Id<Vertex>(12),
  ),
  createSegment(
    id: Id<Segment>(12),
    type: MobilityType.bike,
    startId: Id<Vertex>(12),
    endId: Id<Vertex>(13),
  ),
  createSegment(
    id: Id<Segment>(13),
    type: MobilityType.bike,
    startId: Id<Vertex>(13),
    endId: Id<Vertex>(14),
  ),
];

final List<Segment> t2Segments = [
  createSegment(
    id: Id<Segment>(21),
    type: MobilityType.bike,
    startId: Id<Vertex>(21),
    endId: Id<Vertex>(22),
  ),
  createSegment(
    id: Id<Segment>(22),
    type: MobilityType.bike,
    startId: Id<Vertex>(22),
    endId: Id<Vertex>(23),
  ),
  createSegment(
    id: Id<Segment>(23),
    type: MobilityType.walk,
    startId: Id<Vertex>(23),
    endId: Id<Vertex>(24),
  ),
  createSegment(
    id: Id<Segment>(24),
    type: MobilityType.bike,
    startId: Id<Vertex>(24),
    endId: Id<Vertex>(25),
  ),
];

final List<Segment> t3Segments = [
  createSegment(
    id: Id<Segment>(31),
    type: MobilityType.bike,
    startId: Id<Vertex>(30),
    endId: Id<Vertex>(31),
  ),
  createSegment(
    id: Id<Segment>(32),
    type: MobilityType.bike,
    startId: Id<Vertex>(31),
    endId: Id<Vertex>(32),
  ),
  createSegment(
    id: Id<Segment>(33),
    type: MobilityType.bike,
    startId: Id<Vertex>(32),
    endId: Id<Vertex>(33),
  ),
];

final segmentMockData = [...t1Segments, ...t2Segments, ...t3Segments];
