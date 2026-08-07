import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/editor.dart';
import 'package:map_application/editor/segment_editor.dart';
import 'package:trip_application/trip_application.dart';

extension CollisionEditor on MapEditor {
  Future<void> onCollision(MapElement dragged, MapElement target) async {
    switch ((mode, dragged, target)) {
      case (Sketch m, MapSketchPencil _, MapVertex v):
        final res = await graphEditor.createSegment(
          startVertexId: m.vertexStart,
          endVertexId: v.vertex.id,
          geometry: m.itineraire,
          mobilityType: MobilityType.bike,
        );

        res.fold((_) {}, (segment) => segmentCreated(segment.id));

      case _:
    }
  }
}
