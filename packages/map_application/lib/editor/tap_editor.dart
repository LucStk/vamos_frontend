import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/map_editor.dart';
import 'entities/entities.dart';

extension TapEditor on MapEditor {
  Future<void> onTapped(MapElement element, LatLng latLng) async {
    switch ((mode, element)) {
      case (Idle _, NoMapElement _):
        selection = MapSelection.cursor(latLng: latLng);
      case (Idle _, MapCursor _):
        mode = MapMode.idle();
        selection = MapSelection.none();

      case (Idle _, MapSegment e):
        selection = SegmentSelection(segmentId: e.segmentId);

      case (Idle _, MapVertex e):
        selection = MapSelection.vertex(vertex: e.vertex);

      case (Sketch m, MapSketchSegment _):
        mode = m.copyWith(
          correction: RouteCorrection(grabPoint: latLng, path: [latLng]),
        );

      case _:
    }
  }
}
