import 'package:topology_application/helpers/optimist_geometry.dart';
import 'package:topology_engine/domain/types/geometry.dart';
import 'package:topology_engine/graph/queries/segment_queries.dart';
import 'package:topology_engine/topology_engine.dart';

class GeometryRecalculator {
  late SegmentQueries queries;

  GeometryRecalculator({required GraphStore store}) {
    queries = SegmentQueries(store);
  }

  Geometry computeSegmentGeometry(SegmentId id) {
    final vertices = queries.getVertices(id);
    return generateGeometry(vertices.$1.latLng, vertices.$2.latLng);
  }

  List<SegmentId> recomputeAffectedSegments(VertexId vertexId) {
    return queries.segmentsFromVertex(vertexId).toList();
  }
}
