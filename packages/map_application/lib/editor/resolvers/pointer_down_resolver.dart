import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_elements.dart';
import 'package:map_application/editor/map_context.dart';
import '/editor/entities/entities.dart';

extension PointerDownEditor on MapContext {
  MapElement onPointerDown(MapElement element, LatLng latLng) {
    switch ((mode, element)) {
      case (SketchCreation m, MapSketchSegment _):
        mode = m.copyWith(correction: RouteCorrection(path: [latLng]));
        return MapSketchPencil(latLng);

      case (SketchEdition m, MapSegment s) when s.segment.id == m.segment.id:
        mode = m.copyWith(correction: RouteCorrection(path: [latLng]));
        return MapSketchPencil(latLng);

      case _:
        return element;
    }
  }
}
