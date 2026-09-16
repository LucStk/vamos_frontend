import 'package:map_engine/map_engine.dart';
import 'package:map_engine/utiles/polyline_dist.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';
import 'package:vamos_cartographie/map_editor/gesture_action_resolver/gestures_resolver.dart';

extension PointerDownEditor on PointerDownAction {
  GestureResolution resolve(GesturesResolverContext context) {
    final latLng = context.camera.screenOffsetToLatLng(offset);
    switch ((context.editorState, element)) {
      case (SketchCreation m, MapSketchSegment _):
        final grab = closestPointOnPolyline(latLng, m.path);
        return GestureResolution(
          editorState: m.copyWith(path: m.path.sublist(0, grab.segmentIndex)),
        );
      case (SketchEdition m, MapSegment s) when s.id == m.segmentId:
        return GestureResolution(editorState: m.copyWith(path: [latLng]));
      case _:
        return GestureResolution(editorState: context.editorState);
    }
  }
}
