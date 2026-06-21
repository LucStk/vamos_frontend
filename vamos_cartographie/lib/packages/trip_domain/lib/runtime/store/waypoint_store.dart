import 'package:topology_engine/graph/nodes/collection_node.dart';
import 'package:topology_engine/topology_engine.dart';
import 'package:trip_domain/domain/waypoint.dart';

class WaypointStore {
  final CollectionNode<Waypoint> _store;

  WaypointStore(this._store);

  Waypoint? findByVertex(VertexId vertexId) {}
}
