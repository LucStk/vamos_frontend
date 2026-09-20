import 'package:map_editor_application/map_editor.dart';
import 'package:map_engine/map_engine.dart';
import 'package:map_engine/utiles/polyline_dist.dart';

extension PointerDownEditor on MapEditorController {
  void pointerDownResolve(PointerDownGesture gesture) {
    final latLng = camera.worldOffsetToLatLng(gesture.offset);
    switch ((mode, gesture.element)) {
      case (SketchCreation m, MapSketchSegment _):
        final grab = closestPointOnPolyline(latLng, m.path);
        mode = m.copyWith(path: m.path.sublist(0, grab.segmentIndex));
        return;

      case (SketchEdition m, MapSegment s) when s.id == m.segmentId:
        mode = m.copyWith(path: [latLng]);
        return;
      case _:
    }
  }
}
