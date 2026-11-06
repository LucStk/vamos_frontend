// route/endpoint_appearance.dart
import 'package:flutter/painting.dart';
import 'package:map_canvas/map_canvas.dart';

final class EndpointAppearance {
  const EndpointAppearance({
    required this.glyph,
    required this.color,
    required this.dotColor,
  });

  final IconGlyph glyph;
  final Color color;
  final Color dotColor;
}

abstract final class EndpointAppearances {
  static const _symbols = Rect.fromLTWH(0, -960, 960, 960);

  static const end = EndpointAppearance(
    glyph: IconGlyph(
      'M200-120v-680h360l16 80h224v400H520l-16-80H280v280h-80Z',
      viewBox: _symbols,
      anchor: Offset(240, -120), // pied du mât, à vérifier dans le SVG
    ),
    color: Color(0xFFA5AA2A),
    dotColor: Color(0xFF1B5E20),
  );
}
