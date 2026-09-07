import 'package:trip_application/topology/topology.dart';

sealed class SpliceAnchor {}

final class SegmentAnchor extends SpliceAnchor {
  final SegmentId id;
  SegmentAnchor(this.id);
}

final class VertexAnchor extends SpliceAnchor {
  final VertexId id;
  VertexAnchor(this.id);
}
