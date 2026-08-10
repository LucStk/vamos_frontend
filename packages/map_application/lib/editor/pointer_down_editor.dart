import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/map_editor.dart';
import 'entities/entities.dart';

extension PointerDownEditor on MapEditor {
  MapElement onPointerDown(MapElement element, LatLng latLng) {
    switch ((mode, element)) {
      case (SketchCreation m, MapSketchSegment _):
        mode = m.copyWith(
          correction: RouteCorrection(grabPoint: latLng, path: [latLng]),
        );
        return MapSketchPencil(latLng);

      case _:
        return element;
    }
  }
}
