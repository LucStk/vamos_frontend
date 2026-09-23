import 'dart:ui';

import 'package:map_canvas/domain/domain.dart';

import 'package:map_engine/map_engine.dart';

final class ProjectedTrip extends ProjectedPolyline<MapTripObject> {
  ProjectedTrip({required super.object, required super.worldSegments});

  @override
  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
    final path = this.path;
    final isSelected = context.state == MapObjectVisualState.selected;

    if (isSelected) {
      Paint stroke(double width, Color color) => Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = width
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..color = color;

      return ScreenScale([
        // Halo : 3 passes translucides qui simulent le dégradé du flou
        DrawPath(path: path, paint: stroke(18, const Color(0x1A00E5FF))),
        DrawPath(path: path, paint: stroke(14, const Color(0x3300E5FF))),
        DrawPath(path: path, paint: stroke(10, const Color(0x4D00E5FF))),
        // Contour de contraste
        DrawPath(path: path, paint: stroke(7, const Color(0xFF00363A))),
        // Cœur vif
        DrawPath(path: path, paint: stroke(4, const Color(0xFF00E5FF))),
      ]);
    }

    // 1. Légère ombre/bordure de lisibilité
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = const Color(0x66000000); // Noir à 40% opacité

    // 2. Ligne principale
    final corePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = const Color(0xFF546E7A); // Bleu-Gris élégant

    return ScreenScale([
      DrawPath(path: path, paint: borderPaint),
      DrawPath(path: path, paint: corePaint),
    ]);
  }
}
