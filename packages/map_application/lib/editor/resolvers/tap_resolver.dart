import 'package:latlong2/latlong.dart';
import 'package:map_application/domain/map_objects.dart';
import 'package:map_application/editor/resolvers/gestures_resolver.dart';
import '/editor/entities/entities.dart';

extension TapEditor on GesturesResolver {
  void onTapped(MapObject? element, LatLng latLng) {
    switch ((editorState, element)) {
      case (Idle _, MapObject e) when e is TopologyObject:
        editorState = Idle(selection: e);

      case (SketchMode m, MapSketchPencil p):
        print("mapSketchPencil tap");
        editorState = m.copyWith(selection: p);

      case (Idle _, null):
        editorState = Idle();
      case _:
    }
  }

  void onDoubleTapped(MapObject? element, LatLng latLng) {
    if (element == null) {
      camera.zoomTo(latLng);
    }
  }
}
