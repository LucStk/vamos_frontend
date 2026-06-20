import 'package:domain_core/id.dart';
import 'package:latlong2/latlong.dart';
import 'package:topology_application/application/ports/vertex_move_port.dart';
import 'package:topology_application/patches/patch_store.dart';
import 'package:topology_application/services/geometry_calculator.dart';
import 'package:topology_application/services/optimitis_executor.dart';
import 'package:topology_engine/topology_engine.dart';

class MoveVertex {
  final VertexMovePort port;
  final PatchStore patchStore;
  final GraphStore store;
  final OptimisticExecutor executor;

  MoveVertex(this.port, this.store, this.patchStore, this.executor);

  void _onApply(VertexId vertexId, LatLng latLng) {
    final calculator = GeometryRecalculator(store: store);

    for (final SegmentId sId in calculator.recomputeAffectedSegments(
      vertexId,
    )) {
      final geo = calculator.computeSegmentGeometry(sId);
      patchStore.setSegmentPatch(sId, geo);
    }
  }

  Future<void> call(Id<Vertex> vertexId, LatLng latLng) async {
    late Vertex oldValue;
    await executor.run(
      onApply: () => _onApply(vertexId, latLng),
      remote: () => port.moveVertex(vertexId, latLng),
      onSuccess: (serveurValue) => store.commitUpdate(vertexId, serveurValue),
      onError: () => store.update<Vertex>(vertexId, (v) {
        return oldValue;
      }),
    );
  }
}
