// selection_handle_shape.dart
import 'dart:math';
import 'dart:ui';
import 'package:map_engine/map_engine.dart';

abstract final class SelectionHandleShape {
  static const radius = 8.0; // rayon du corps, en px
  static const tipToCenter = 15.0; // pointe -> centre du corps, en px

  /// Demi-goutte en px, (0,0) = pointe, y vers le bas.
  /// `start` = moitié gauche, `end` = moitié droite.
  static Path halfDrop(HandleSide side) {
    const r = radius;
    const d = tipToCenter;

    // Point de tangence : la pointe voit le cercle sous l'angle θ.
    final theta = acos(r / d);
    final tangent = Offset(r * sin(theta), d - r * cos(theta));

    final circle = Rect.fromCircle(center: const Offset(0, d), radius: r);
    final path = Path()..moveTo(0, 0);

    switch (side) {
      case HandleSide.end:
        // pointe -> tangente droite -> arc par la droite -> bas -> axe
        path
          ..lineTo(tangent.dx, tangent.dy)
          ..arcTo(circle, theta - pi / 2, pi - theta, false);
      case HandleSide.start:
        // pointe -> bas (axe) -> arc par la gauche -> tangente gauche
        path
          ..lineTo(0, d + r)
          ..arcTo(circle, pi / 2, pi - theta, false);
    }
    return path..close();
  }
}
