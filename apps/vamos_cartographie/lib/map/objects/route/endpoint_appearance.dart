// route/endpoint_appearance.dart
import 'package:flutter/painting.dart';
import 'package:map_canvas/map_canvas.dart';

final class EndpointAppearance {
  const EndpointAppearance({
    required this.glyph,
    required this.color,
    this.dotColor, // null = pas de point de contrôle
    this.glyphPx = 24,
  });

  final IconGlyph glyph;
  final Color color;
  final Color? dotColor;
  final double glyphPx;
}

// route/endpoint_appearance.dart
abstract final class EndpointAppearances {
  static const start = EndpointAppearance(
    glyph: IconGlyph(
      'M12 22q-2.05 0-3.875-.788t-3.187-2.15t-2.15-3.187T2 12q0-2.075.788-3.887t2.15-3.175t3.187-2.15T12 2q2.075 0 3.888.788t3.174 2.15t2.15 3.175T22 12q0 2.05-.788 3.875t-2.15 3.188t-3.175 2.15T12 22m0-4q2.5 0 4.25-1.75T18 12t-1.75-4.25T12 6T7.75 7.75T6 12t1.75 4.25T12 18',
    ),
    color: Color(0xFF2E7D32),
    glyphPx: 22,
  );

  static const end = EndpointAppearance(
    glyph: IconGlyph(
      'M5 21V4h9l.4 2H20v10h-7l-.4-2H7v7z',
      anchor: Offset(6, 21), // pied du mât
    ),
    color: Color(0xFFC62828),
    dotColor: Color(0xFF7F1D1D),
    glyphPx: 30,
  );
}
