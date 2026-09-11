import 'dart:ui';

import 'package:map_application/gestures_resolver/gestures_resolver.dart';
import 'package:map_application/map_application.dart';
import 'package:map_application/utiles/polyline_dist.dart';

extension PointerDownEditor on GesturesResolver {
  void onPointerDown(MapObject? element, Offset offset) {
    final latLng = camera.screenOffsetToLatLng(offset);
    switch ((editorState, element)) {
      case (SketchCreation m, MapSketchSegment _):
        final grab = closestPointOnPolyline(latLng, m.path);
        editorState = m.copyWith(path: m.path.sublist(0, grab.segmentIndex));

      case (SketchEdition m, MapSegment s) when s.id == m.segmentId:
        editorState = m.copyWith(path: [latLng]);
      case _:
    }
  }
}
