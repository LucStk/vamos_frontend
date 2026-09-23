import 'package:flutter/material.dart';

/// Painter simple qui dessine un rond au centre ou à une position donnée
class TestPointPainter extends CustomPainter {
  const TestPointPainter({
    this.color = Colors.red,
    this.radius = 2.0,
    this.offset,
  });

  final Color color;
  final double radius;
  final Offset? offset;

  @override
  void paint(Canvas canvas, Size size) {
    // Si aucun offset n'est fourni, on place le rond au centre de la surface
    final center = offset ?? Offset(size.width / 2, size.height / 2);

    // Remplissage du cercle
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Bordure blanche pour la visibilité
    final strokePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(center, radius, fillPaint);
    canvas.drawCircle(center, radius, strokePaint);
  }

  @override
  bool shouldRepaint(covariant TestPointPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.radius != radius ||
        oldDelegate.offset != offset;
  }
}
