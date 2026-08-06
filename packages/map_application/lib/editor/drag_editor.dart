import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/map_editor.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';
import 'entities/entities.dart';

extension DragEditor on MapEditor {
  Future<void> onDragStart(MapElement element) async {}

  Future<void> onDragUpdate(MapElement element, LatLng latLng) async {
    switch (element) {
      case MapVertex e:
        // Accès direct au sous-éditeur, comme dans tes effets
        final patch = VertexPatchModel(id: e.vertex.id, latLng: latLng);
        graphEditor.state = graphEditor.state.setVertex(patch);

      case MapCursor _:
        selection = MapSelection.cursor(latLng: latLng);

      case MapSketchPencil _:
        if (mode is! Sketch) return;
        final m = (mode as Sketch);

        if (m.correction != null) {
          final correctionPath = [...m.correction!.path, latLng];
          mode = m.copyWith(
            correction: m.correction!.copyWith(path: correctionPath),
          );
        }
        final itineraire = [...m.itineraire, latLng];

        mode = m.copyWith(itineraire: itineraire);

      case _:
    }
  }

  Future<void> onDragEnd(MapElement element, LatLng latLng) async {
    switch (element) {
      case MapVertex e:
        mode = MapMode.idle();
        await graphEditor.moveVertex(e.vertex.id, latLng);
      case MapCursor _:
        selection = MapSelection.cursor(latLng: latLng);
      case _:
    }
  }
}
