// lib/editor/segment_editor.dart
import 'package:map_application/map_application.dart';
import 'package:trip_application/topology/domain/domain.dart';

extension WaypointEditor on MapEditor {
  Future<void> createWaypointAtCursor() async {
    if (selection case MapCursor(:final latLng)) {
      selection = NoMapElement();
      await runEffect(CreateWaypointFromPosition(latLng));
    }
  }

  Future<void> waypointCreated(VertexFields vertex) async {
    selection = MapVertex(vertex);
  }
}
