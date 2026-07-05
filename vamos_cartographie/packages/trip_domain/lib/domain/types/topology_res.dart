import '/domain/entities/entities.dart';

class TopologyRes {
  final List<Vertex> vertices;

  final List<Segment> segments;
  TopologyRes(this.vertices, this.segments);
}
