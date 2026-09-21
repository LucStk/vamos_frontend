import 'package:latlong2/latlong.dart';
import 'package:map_application/map_application.dart';
import 'package:map_editor_application/map_editor.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/utiles/polyline_dist.dart';

GestureResult<MapEditorMode> handlePointerDown(
  MapEditorMode mode,
  PointerDownGesture gesture,
  LatLng latLng,
) {
  switch ((mode, gesture.element)) {
    case (SketchCreation m, MapSketchSegment _):
      final grab = closestPointOnPolyline(latLng, m.path);
      return GestureResult(
        mode: m.copyWith(path: m.path.sublist(0, grab.segmentIndex)),
      );

    case (SketchEdition m, MapSegment s) when s.id == m.segmentId:
      return GestureResult(mode: m.copyWith(path: [latLng]));
    case _:
      return GestureResult();
  }
}
