import 'package:flutter/rendering.dart';
import 'package:map_application/map_application.dart';

class MapScenePainter extends CustomPainter {
  const MapScenePainter({required this.scene});

  final ProjectedScene scene;

  @override
  void paint(Canvas canvas, Size size) {
    for (final object in scene.objects) {
      _paintObject(canvas, object);
    }
  }

  void _paintObject(Canvas canvas, ProjectedObject object) {
    final paint = Paint()..style = PaintingStyle.fill;

    switch (object) {
      case ProjectedPoint point:
        canvas.drawCircle(point.projectedPosition, point.object.radius, paint);

      case ProjectedLine line:
        final path = Path();

        for (var i = 0; i < line.projectedPoints.length; i++) {
          final point = line.projectedPoints[i];

          if (i == 0) {
            path.moveTo(point.dx, point.dy);
          } else {
            path.lineTo(point.dx, point.dy);
          }
        }

        canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(MapScenePainter oldDelegate) {
    return scene != oldDelegate.scene;
  }
}
