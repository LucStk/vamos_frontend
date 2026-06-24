import 'package:topology_application/helpers/optimist_geometry.dart';
import 'package:trip_domain/runtime/store/graph_store.dart';

class GeometryRecalculator {
  late GraphStore store;

  GeometryRecalculator({required GraphStore store}) {
    store = (store);
  }

  Geometry computeSegmentGeometry(SegmentId id) {
    final vertices = queries.getVertices(id);
    return generateGeometry(vertices.$1.latLng, vertices.$2.latLng);
  }

  List<SegmentId> recomputeAffectedSegments(VertexId vertexId) {
    return queries.segmentsFromVertex(vertexId).toList();
  }
}
