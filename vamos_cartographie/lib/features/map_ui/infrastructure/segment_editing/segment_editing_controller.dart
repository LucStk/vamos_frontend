import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/entities.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/application/command_handlers/command_handlers.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/queries/selectors/graph_selectors.dart';

part 'segment_editing_controller.g.dart';

@Riverpod(keepAlive: true)
class SegmentEditingController extends _$SegmentEditingController {
  @override
  Id<Vertex>? build(Id<Trip> tripId) {
    return null; // C'est l'état initial
  }

  T readNode<T>(Id<T> id) => ref.read(nodeRequiredProvider<T>(tripId, id));

  SegmentHandler get segmentHandler =>
      ref.read(segmentHandlerProvider(tripId).notifier);

  void startWaypoint(Id<Vertex> vertexId) {
    state = vertexId;
  }

  bool isCreating() {
    return state != null;
  }

  void addVertexOnSegment(Id<Vertex> vertexId, Id<Segment> segmentId) {
    final Vertex vertex = readNode<Vertex>(vertexId);
    final Segment segment = readNode<Segment>(segmentId);
  }

  List<LatLng> createOptimiticGeometry(
    Id<Vertex> startVertexId,
    Id<Vertex> endVertexId,
  ) {
    final Vertex startVertex = readNode<Vertex>(startVertexId);
    final Vertex endVertex = readNode<Vertex>(startVertexId);
    return [startVertex.latLng, endVertex.latLng];
  }

  Future<void> endWaypoint(Id<Vertex> endVertexId) async {
    // 4. On récupère la valeur actuelle de l'état
    final currentStartVertexId = state;

    if (currentStartVertexId == null) {
      throw Exception("No startVertexId defined $state");
    }

    final draft = SegmentDraft(
      startVertexId: currentStartVertexId,
      endVertexId: endVertexId,
    );

    final optimistGeo = createOptimiticGeometry(
      currentStartVertexId,
      endVertexId,
    );

    // Optionnel : réinitialiser l'état après la création
    state = null;

    await segmentHandler.createSegment(draft, optimistGeo);
  }
}
