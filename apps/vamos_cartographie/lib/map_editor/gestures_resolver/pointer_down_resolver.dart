import 'package:map_engine/map_engine.dart';
import 'package:map_engine/pointer_events_resolver/pointer_events_resolver_output.dart';
import 'package:map_engine/utiles/polyline_dist.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';
import 'package:vamos_cartographie/map_editor/gestures_resolver/gestures_resolver_input.dart';
import 'package:vamos_cartographie/map_editor/gestures_resolver/gestures_resolver_output.dart';

extension PointerDownEditor on PointerDownAction {
  GesturesResolverOutput resolve(GesturesResolverInput input) {
    final latLng = input.camera.screenOffsetToLatLng(offset);
    switch ((input.editorState, element)) {
      case (SketchCreation m, MapSketchSegment _):
        final grab = closestPointOnPolyline(latLng, m.path);
        return GesturesResolverOutput(
          editorState: m.copyWith(path: m.path.sublist(0, grab.segmentIndex)),
        );
      case (SketchEdition m, MapSegment s) when s.id == m.segmentId:
        return GesturesResolverOutput(editorState: m.copyWith(path: [latLng]));
      case _:
        return GesturesResolverOutput(editorState: input.editorState);
    }
  }
}
