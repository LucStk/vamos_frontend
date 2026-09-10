import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_objects.dart';
import 'package:map_application/editor/resolvers/gestures_resolver.dart';
import '/editor/entities/entities.dart';

extension PointerDownEditor on GesturesResolver {
  void onPointerDown(MapObject element, LatLng latLng) {
    switch ((editorState, element)) {
      case (SketchCreation m, MapSketchSegment _):
        editorState = m.copyWith(correction: RouteCorrection(path: [latLng]));

      case (SketchEdition m, MapSegment s) when s.id == m.segment.id:
        editorState = m.copyWith(correction: RouteCorrection(path: [latLng]));
      case _:
    }
  }
}
