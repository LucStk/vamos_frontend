import 'dart:ui';

import 'package:map_application/gestures_resolver/gestures_resolver.dart';
import 'package:map_application/map_application.dart';

extension PointerDownEditor on GesturesResolver {
  void onPointerDown(MapObject? element, Offset offset) {
    final latLng = camera.screenOffsetToLatLng(offset);
    switch ((editorState, element)) {
      case (SketchCreation m, MapSketchSegment _):
        editorState = m.copyWith(correction: RouteCorrection(path: [latLng]));

      case (SketchEdition m, MapSegment s) when s.id == m.segment.id:
        editorState = m.copyWith(correction: RouteCorrection(path: [latLng]));
      case _:
    }
  }
}
