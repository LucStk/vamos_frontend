import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';

extension DragEditor on MapEditor {
  Future<void> onDragStart(MapElement element) async {}

  Future<void> onDragUpdate(MapElement element, LatLng latLng) async {
    switch ((mode, element)) {
      case (Idle _, MapVertex e):
        final patch = VertexPatchModel(id: e.vertex.id, latLng: latLng);
        graphEditor.state = graphEditor.state.setVertex(patch);

      case (Idle _, MapCursor _):
        selection = MapSelection.cursor(latLng: latLng);

      case (Sketch m, MapSketchPencil _):
        if (m.correction != null) {
          final correctionPath = [...m.correction!.path, latLng];
          mode = m.copyWith(
            correction: m.correction!.copyWith(path: correctionPath),
          );
        } else {
          final itineraire = [...m.itineraire, latLng];
          mode = m.copyWith(itineraire: itineraire);
        }
      case _:
    }
  }

  Future<void> onDragEnd(MapElement element, LatLng latLng) async {
    switch ((mode, element)) {
      case (Idle _, MapVertex e):
        mode = MapMode.idle();
        await graphEditor.moveVertex(e.vertex.id, latLng);
      case (Idle _, MapCursor _):
        selection = MapSelection.cursor(latLng: latLng);
      case _:
    }
  }
}
