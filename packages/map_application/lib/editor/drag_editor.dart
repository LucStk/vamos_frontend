import 'package:latlong2/latlong.dart';
import 'package:map_application/editor/map_editor.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_application/trip_application.dart';

extension DragEditor on MapEditor {
  Future<void> onDragStart(MapElement element) async {}

  Future<void> onDragUpdate(MapElement element, LatLng latLng) async {
    switch (element) {
      case MapVertex e:
        // Accès direct au sous-éditeur, comme dans tes effets
        final patch = VertexPatchModel(id: e.vertex.id, latLng: latLng);
        graphEditor.state = graphEditor.state.setVertex(patch);

      case MapCursor _:
        state = state.copyWith(selection: MapSelection.cursor(latLng: latLng));
      case _:
    }
  }

  Future<void> onDragEnd(MapElement element, LatLng latLng) async {
    switch (element) {
      case MapVertex e:
        state = state.copyWith(mode: MapMode.idle());
        await graphEditor.moveVertex(e.vertex.id, latLng);
      case MapCursor _:
        state = state.copyWith(selection: MapSelection.cursor(latLng: latLng));
      case _:
    }
  }
}
