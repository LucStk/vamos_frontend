import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/map_editor.dart';
import 'entities/entities.dart';

extension TapEditor on MapEditor {
  Future<void> onTapped(MapElement element, LatLng latLng) async {
    switch (element) {
      case MapCursor _:
        mode = MapMode.idle();
        selection = MapSelection.none();

      case MapSegment e:
        selection = SegmentSelection(segmentId: e.segmentId);
      case MapVertex e:
        mode = MapMode.idle();
        selection = MapSelection.vertex(vertex: e.vertex);

      case MapSketchSegment e:
        if (mode is! Sketch) return;
        final m = (mode as Sketch);
        mode = m.copyWith(
          correction: RouteCorrection(grabPoint: latLng, path: [latLng]),
        );

      case _:
    }
  }
}
