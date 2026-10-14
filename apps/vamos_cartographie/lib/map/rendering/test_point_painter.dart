import 'package:flutter/material.dart';

/// Painter simple qui dessine un rond au centre ou à une position donnée
class TestPointPainter extends CustomPainter {
  TestPointPainter({
    required this.zoomScale,
    this.color = Colors.red,
    this.radiusPx = 4,
    this.strokePx = 1,
    this.offset,
  });

  final double zoomScale;
  final Color color;
  final double radiusPx; // taille voulue à l'écran
  final double strokePx;
  final Offset? offset;

  @override
  void paint(Canvas canvas, Size size) {
    final center = offset ?? Offset(size.width / 2, size.height / 2);
    final r = radiusPx / zoomScale; // px -> unités monde

    canvas.drawCircle(center, r, Paint()..color = color);
    canvas.drawCircle(
      center,
      r,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokePx / zoomScale,
    );
  }

  @override
  bool shouldRepaint(TestPointPainter old) =>
      old.zoomScale != zoomScale ||
      old.color != color ||
      old.radiusPx != radiusPx ||
      old.strokePx != strokePx ||
      old.offset != offset;
}
