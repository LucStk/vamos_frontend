import 'package:flutter/material.dart'; // réexporte déjà flutter/painting.dart
import 'package:map_canvas/map_canvas.dart';

abstract final class ChainWaypointStyle {
  static DrawCommand build(
    Path path, {
    required ScreenLength radius,
    bool pending = false,
    double time = 0,
  }) {
    return DrawPath(
      path: path,
      style: Stroke(
        Colors.grey,
        width: ScreenLength(4),
        // [trait, vide, trait, vide...] : ici 8 px de trait, 6 px de vide,
        // constants à l'écran quel que soit le zoom.
        dash: [ScreenLength(8), ScreenLength(6)],
      ),
    );
  }
}
