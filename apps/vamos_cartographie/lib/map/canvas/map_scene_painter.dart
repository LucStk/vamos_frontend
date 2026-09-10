import 'package:flutter/rendering.dart';
import 'package:map_application/map_application.dart';

class MapScenePainter extends CustomPainter {
  const MapScenePainter({required this.scene, required this.selection});

  final ProjectedScene scene;
  final MapObject? selection;

  @override
  void paint(Canvas canvas, Size size) {
    for (final projected in scene.objects) {
      final state = _visualState(projected.object);

      projected.paint(canvas, context: MapPaintContext(state: state));
    }
  }

  MapObjectVisualState _visualState(MapObject object) {
    if (selection != null && selection.isSameAs(object)) {
      return MapObjectVisualState.selected;
    }

    return MapObjectVisualState.normal;
  }

  @override
  bool shouldRepaint(MapScenePainter oldDelegate) {
    return scene != oldDelegate.scene || selection != oldDelegate.selection;
  }
}
